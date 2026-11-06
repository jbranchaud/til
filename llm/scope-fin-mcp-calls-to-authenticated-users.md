# Scope Fin MCP Calls To Authenticated Users

I'm working on an app that integrates with [Intercom](https://www.intercom.com/)
to provide an AI-assisted chat interface that can potentially answer questions
based on a knowledge base. Intercom's AI assistant is called Fin. They recently
added [support for custom MCP connectors](https://www.intercom.com/integrations/connectors/intercom-mcp-server)
so that Fin can integrate even more deeply with an app and its data.

We already have access to the MCP tightly controlled by scoped, short-lived
JWTs that we verify on every call within our server. As we do a limited roll-out
of this feature, we have a lot of customers that are continuing to interact with
the existing Intercom Messenger. Those users should continue to get AI-assisted
answers based on the knowledge base. Because they are not yet being granted
access to the MCP capability, Fin should not even try making those tool calls on
their behalf.

Unfortunately, Fin thinks some questions might be answerable with some MCP calls
and tries to make them. Because that user isn't authorized for MCP, we reject
the calls and we see a bunch of "failed tool call" errors piling up in the
Intercom logs for each of those connectors.

Fin shouldn't be trying to call these tools in the first place. The solution is
to create a scoped _Audience_ in Intercom and assign that as the audience for
each of these MCP connectors. Specifically, we scope the audience to only be
those users that have our `app_fin_token` set. That unique token gets set on the
_User Data_ of each Intercom user who should have access to the MCP.

The audience that we green-light for MCP tool calls are only those Intercom
users who have this token set. With that in place, Fin will no longer be making
a bunch of insta-fail MCP tool calls on behalf of unauthorized users.

In Intercom's _Settings_ panel, toggle open the _AI & Automation_ options. Click
the _Audiences_ option. Then add a new audience. The default rule of "Users,
Vistors, and Leads" is fine. Add another audience rule and find the relevant
_User Data_ property (in my case, `app_fin_token`). Set it to "has any value".
Save that audience and then update the audience for each MCP data connector.
This option is under the _Fin_ tab when editing the connector.

[source](https://www.intercom.com/help/en/articles/9357948-manage-audiences-for-fin-and-copilot)
