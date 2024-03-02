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
mac-brightnessctl -f 5 0.5       Flash the keyboard lights 5 times with an interval of 0.5 seconds and optional fade speed [s].
                                 If [s] is not provided, the default fade speed is 500 milliseconds.
                                 
```
## Installation
```bash
brew tap rakalex/mac-brightnessctl
brew install mac-brightnessctl
```

## Inspiration

This project was inspired by the work of [EthanRDoesMC](https://github.com/EthanRDoesMC) and their repository [KBPulse](https://github.com/EthanRDoesMC/KBPulse). I have built upon their ideas and adapted the code to suit the needs of my project.
