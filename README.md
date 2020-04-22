# Shadowplay On Linux

Shadowplay's replay feature on Linux

- nvenc-compatible

## Prerequisites

- Have FFMPEG installed
	- `sudo pacman -S ffmpeg`
- Have Xbindkeys installed
	- `sudo pacman -S xbindkeys`

## Configuration

- Change `FPS` to your desired recording framerate. Default is 60.

- Change `RESOLUTION` to your resolution. (X11 resolution). Default is 1920x1080.

- Change `REPLAY_BUFFER` to your desired save time. Default is 00:05:00 for 5min. 

- Change `VIDEO_FOLDER` to the folder where you want replays saved. Default is ${HOME}/Videos/ (/home/YOUR_USER/Videos/)

## Setup

### Keybind Setup
First, configure the key (or key combo) you want to use in order to save your replays.
- For instructions on how to bind keys, check [here](http://xahlee.info/linux/linux_xbindkeys_tutorial.html) 
- Bind a key to the command `killall --user $USER --ignore-case --signal SIGTERM  ffmpeg` so it looks something like this:
```
# make F9 save Shadowplay replay
"killall --user $USER --ignore-case --signal SIGTERM ffmpeg"
   F9
```
- Start xbindkeys with `xbindkeys -f ~/.xbindkeysrc`, or reload it with `killall -s1 xbindkeys` if it's already running, for the new bind to take effect.

### Script

- Run the Shadowplay script with `./shadowplay` in a terminal
- Press your configured hotkey to save the replay. 

## TODO
- Systemd service/timer integration
- Automatic deletion of video recorded older than the replay buffer

## Notes
When recording for long intervals, it may take some time to save your replays.

Heavily inspired by [Toqozz's script](https://github.com/Toqozz/shadowplay-linux).

Thank you [Tyler](https://github.com/durcor) for answering my stupid questions while making this.
