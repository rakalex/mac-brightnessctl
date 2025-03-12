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
mac-brightnessctl -f 5 0.5 [s]   Flash the keyboard lights 5 times with an interval of 0.5 seconds and optional fade speed [s].
                                 If [s] is not provided, the default fade speed is 500 milliseconds.
```
Visual alerts example
```bash
ping google.com -c 3 && mac-brightnessctl -f 5 0.5 100 #So, when the ping command is completed successfully, the lights will flash five times with the specified brightness settings.
```


## Installation

If you use [Homebrew](https://brew.sh):

```bash
brew tap rakalex/mac-brightnessctl
brew install mac-brightnessctl
```

Or if you use [MacPorts](https://www.macports.org):

```bash
sudo port install mac-brightnessctl
```

Or install manually from source:

```bash
# Set the version of mac-brightnessctl you want to install
# See https://github.com/rakalex/mac-brightnessctl/releases for the latest version
VERSION=0.2.1

# Download source code and enter directory
curl -L https://github.com/rakalex/mac-brightnessctl/archive/refs/tags/${VERSION}.tar.gz | tar xz
cd mac-brightnessctl-${VERSION}

# Make sure the Command Line Tools (which provide the Clang compiler) are installed
clang --version || xcode-select -–install

# Compile binary
make

# Put the binary in a directory in your $PATH, e.g. /usr/local/bin/
sudo cp mac-brightnessctl /usr/local/bin/

# Clean up after yourself
cd .. 
rm -rf mac-brightnessctl-${VERSION}
unset VERSION
```

## Inspiration

This project was inspired by the work of [EthanRDoesMC](https://github.com/EthanRDoesMC) and their repository [KBPulse](https://github.com/EthanRDoesMC/KBPulse). I have built upon their ideas and adapted the code to suit the needs of my project.
