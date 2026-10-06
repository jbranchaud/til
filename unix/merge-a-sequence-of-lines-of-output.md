# Merge A Sequence Of Lines Of Output

More often than not when I'm chaining a sequence of Unix commands together, I'm
eventually trying to fan them out or execute each argument separately. I
recently had the need for a bunch of separate lines of output to be fanned back
in to a single line.

The tool I found for this job is `paste` (not the most intuitive name).

> merge corresponding or subsequent lines of files

I was listing out all the categories that my active [TIL posts](https://github.com/jbranchaud/til) full under. I used the following
command to do that.

```bash
❯ git ls-files '*/*.md' | cut -d/ -f1 | sort -u
ack
ansible
astro
aws
bash
brew
chrome
...
```

Those are all my categories, but then the format I really wanted was for them to
be all on the same line with a clear delimiter so that I could paste them for
[use in another script](/llm/translate-to-canonical-tags-with-small-model.md).

The trick is to tack on one more pipe to `paste`. The `-s` tells `paste` to join
every line from a given input file (e.g. stdin) onto a single line. The `-d`
allows for overriding the default delimiter (tab) with something like a `,`.
Lastly, the trailing `-` tells `paste` to read from stdin rather than some other
named file(s).

```bash
❯ git ls-files '*/*.md' | cut -d/ -f1 | sort -u | paste -sd, -
ack,ansible,astro,aws,bash,brew,chrome,claude-code,clojure,css,cursor,deno,devops,docker,drizzle,elixir,gatsby,git,github,github-actions,go,groq,heroku,html,http,inngest,internet,java,javascript,jj,jq,kitty,linux,llm,mac,math,mise,mongodb,mysql,neovim,netlify,next-auth,nextjs,phoenix,planetscale,pnpm,postgres,prisma,python,rails,react,react_native,react-testing-library,reason,remix,rspec,ruby,sed,shell,sqlite,streaming,tailwind,taskfile,tmux,typescript,unix,vercel,vim,vscode,webpack,workflow,xstate,yaml,zed,zod,zsh
```

See `man paste` for more details.
