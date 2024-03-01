# mac-brightnessctl
mac-brightnessctl is a command line tool for controlling the keyboard backlight brightness on macOS.
## Usage
```bash
mac-brightnessctl [<option>] [<value>]
```
## Examples
```bash
mac-brightnessctl 0.75           Set brightness to 75%
mac-brightnessctl                Get current brightness
mac-brightnessctl -a             Get current state of auto-brightness
mac-brightnessctl -a 1           Enable auto-brightness
mac-brightnessctl -s             Get current state of suspend idle dimming
mac-brightnessctl -s 1           Suspend idle dimming
mac-brightnessctl -t             Get current state of idle dim time
mac-brightnessctl -t 5           Set idle dim time to 5 seconds
```

## Inspiration

This project was inspired by the work of [EthanRDoesMC](https://github.com/EthanRDoesMC) and their repository [KBPulse](https://github.com/EthanRDoesMC/KBPulse). I have built upon their ideas and adapted the code to suit the needs of my project.
