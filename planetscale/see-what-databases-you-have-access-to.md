# See What Databases You Have Access To

Assuming you have the `pscale` CLI installed and you've authenticated with it,
you can run the following to view available databases.

```bash
$ pscale database list
  NAME        KIND    CREATED AT    UPDATED AT
 ----------- ------- ------------- -------------
  bookshelf   mysql   3 years ago   3 years ago
```

I'm not very active on my personal account. Planetscale is a multi-tenant SaaS
though. I can switch from my personal `org` to another team I have access to.

```bash
$ pscale org switch another-team
```

And then from there I can run `pscale database list` again to see what databases
I have access to from this other organization.

See `pscale database help` and `pscale org help` for more details.
