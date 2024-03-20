# Add Subtitles To Existing Mux Video Asset

There is a [JavaScript/TypeScript Mux
SDK](https://github.com/muxinc/mux-node-sdk) for interacting with Mux via their
[API](https://docs.mux.com/api-reference).

With a Mux client (initialized from `MUX_ACCESS_TOKEN` and `MUX_SECRET_KEY` in
our environment), we can destructure `Video` which will allow us to call
`Video.Assets.createTrack`. We pass that function the ID of an existing video
asset and then an object of data defining the subtitle track. In this case, it
is an English subtitle track. We need to point Mux to a `url` where the WebVTT
formatted subtitles are hosted.

```typescript
// add-srt-to-specific-video.ts

import Mux from '@mux/mux-node'

require('dotenv-flow').config({
  default_node_env: 'development',
})

const assetId = "mux-asset-id" // set this value
const srtUrl = "https://public-webvtt-file" // set this value

// Set up Mux API Client
const MUX_ACCESS_TOKEN = process.env.MUX_ACCESS_TOKEN as string
const MUX_SECRET_KEY = process.env.MUX_SECRET_KEY as string
const muxClient = new Mux(MUX_ACCESS_TOKEN, MUX_SECRET_KEY)
const {Video} = muxClient

await Video.Assets.createTrack(assetId, {
  url: srtUrl,
  type: 'text',
  text_type: 'subtitles',
  closed_captions: false,
  language_code: 'en-US',
  name: 'English',
  passthrough: 'English',
})
```

We can run the above script with `ts-node` from the command-line like so:

```bash
$ npx ts-node --files --skipProject add-srt-to-specific-video.ts
```

We'll see the new track on the existing asset in the Mux dashboard.
