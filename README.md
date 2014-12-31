# mpd-pulseaudio

Docker image for running [MPD](http://www.musicpd.org/doc/user/) on music
mounted from a host directory, and streaming to a PulseAudio server

### Assumptions

* You have music you'd like to serve with mpd available in a directory on your
  Docker host.
* You want to stream the audio to a PulseAudio server on the network

### Usage

MPD is configured to look in the `/music` directory on the container for
music to serve.  You must mount your host directory on `/music`

MPD will also save its data to `/mpd`, which may optionally be mounted

Suggested use:
```
docker run -dte PULSE_SERVER=<server IP> -p 6600:6600 -v /mnt/music:/music:ro \
           			     	    	      -v /mnt/music/.mpd:/mpd 
```

