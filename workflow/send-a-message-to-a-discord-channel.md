# Send A Message To A Discord Channel

I recently added a form to [visualmode.dev](https://www.visualmode.dev) that
when submitted should send the details to an internal channel in my discord
server.

I didn't need to set up an _App_ or a _Bot_ to do this. It is much simpler than
that. All I needed was a valid [_webhook_
endpoint](https://discord.com/developers/docs/resources/webhook) for my channel
that I can `POST` to.

From Discord, I can select _Edit Channel_ for a specific channel, go to the
_Integrations_ tab, go to _Webhooks_, and then create a _New Webhook_. I can
name it, save it, and then copy the webhook URL.

As a demonstration, I can `POST` to that webhook URL using `cURL` like so:

```bash
curl -H "Content-Type: application/json" -X POST -d '{"content":"Hello from cURL!"}' <YOUR_WEBHOOK_URL>
```

Similarly, in some non-public-facing code like a Next.js serverless function, I
can `POST` to that webhook URL with the `content` that I want to appear in my
channel.

```
import { NextResponse } from 'next/server'

export async function POST(request: Request) {
  const data = await request.json()

  const discordWebhookUrl = process.env.DISCORD_WEBHOOK_URL
  if (discordWebhookUrl) {
    try {
      const response = await fetch(discordWebhookUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          content: `New contact form submission:\nName: ${data.name}\nEmail: ${data.email}\nCompany: ${data.company}\nPhone: ${data.phone}\nMessage: ${data.message}`,
        }),
      })

      if (!response.ok) {
        throw new Error('Failed to send Discord message')
      }
    } catch (error) {
      console.error('Error sending to Discord:', error)
      return NextResponse.json(
        { error: 'Failed to process form submission' },
        { status: 500 },
      )
    }
  }

  return NextResponse.json({ message: 'Form submitted successfully' })
}
```

This [Structure of Webhook
guide](https://birdie0.github.io/discord-webhooks-guide/discord_webhook.html)
has more details on how to specifically structure and format a more complex
message.
