# Monitor An Audio Input Device In OBS

I hooked up a Mirabox HDMI capture card with loop out between my Xbox 360 and
display. It passes the feed through to my MacBook Pro. Both the video and audio
pass through cleanly to OBS and I've been streaming successfully to Twitch with
that setup.

I then wanted to add my headphones and Blue Yeti microphone into the setup so
that I could hear the game audio and talk during the stream.

Despite OBS picking up the audio through the Audio Input Device, I couldn't
hear it in my headphones. That's because by default _Audio Monitoring_ is
turned off for audio devices.

If I want to be able to hear the sound and pass it through as output to OBS, I
have to change the _Audio Monitoring_ setting for that device. In the _Audio
Mixer_ section, there is a gear icon next to the audio device. I click that and
choose _Advanced Audio Properties_. From there, I change that device's Audio
Monitoring setting from _Monitor Off_ to _Monitor and Output_.

Now I am able to hear the audio that is coming through Mirabox from my Xbox.
And anyone watching my stream can hear it too.
