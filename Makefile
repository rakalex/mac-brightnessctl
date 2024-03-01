CC = clang
CFLAGS = -Wall -Wextra -O2
LDFLAGS = -framework Foundation

SRC = main.m BrightnessControl.m KeyboardManager.m
OUT = mac-brightnessctl

all: $(OUT)

$(OUT): $(SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	rm -f $(OUT)

.PHONY: all clean
