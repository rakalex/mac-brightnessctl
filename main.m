#import <stdio.h>
#import <stdlib.h>
#import <string.h>
#import <Foundation/Foundation.h>
#import "BrightnessControl.h"
#import "KeyboardManager.h"

void printUsage(void);

void handleAutoBrightness(int argc, const char *argv[]);
void handleSuspendIdleDimming(int argc, const char *argv[]);
void handleIdleDimTime(int argc, const char *argv[]);
void handleSetBrightness(int argc, const char *argv[]);
void handleFlashKeyboardLights(int argc, const char *argv[]);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [KeyboardManager configure];

        if (argc == 1) {
            float currentBrightness = [BrightnessControl getBrightness];
            printf("Current brightness: %.2f\n", currentBrightness);
        } else if (argc >= 2) {
            switch (argv[1][1]) {
                case 'h':
                    printUsage();
                    break;
                case 'a':
                    handleAutoBrightness(argc, argv);
                    break;
                case 'f':
                    handleFlashKeyboardLights(argc, argv);
                    break;
                case 's':
                    handleSuspendIdleDimming(argc, argv);
                    break;
                case 't':
                    handleIdleDimTime(argc, argv);
                    break;
                default:
                    handleSetBrightness(argc, argv);
                    break;
            }
        } else {
            printUsage();
        }
    }

    return 0;
}

void printUsage(void) {
    printf("Usage: mac-brightnessctl [<option>] [<value>]\n\n");

    printf("Options:\n");
    printf("  <value>   Set the brightness between 0.0 and 1.0.\n");
    printf("            If no argument is given, display the current brightness.\n");
    printf("  -a        Enable or disable auto-brightness. Use '1' or '0'.\n");
    printf("  -s        Suspend or resume idle dimming. Use '1' or '0'.\n");
    printf("  -t        Set the idle dim time in seconds.\n");
    printf("  -f        Flash the keyboard lights [n] times with interval [t] seconds. Handy for creating visual alerts, notifications, or attention-grabbing effects.\n\n");

    printf("Examples:\n");
    printf("  mac-brightnessctl 0.75           Set brightness to 75%%\n");
    printf("  mac-brightnessctl                Get current brightness\n");
    printf("  mac-brightnessctl -a             Get current state of auto-brightness\n");
    printf("  mac-brightnessctl -a 1           Enable auto-brightness\n");
    printf("  mac-brightnessctl -s             Get current state of suspend idle dimming\n");
    printf("  mac-brightnessctl -s 1           Suspend idle dimming\n");
    printf("  mac-brightnessctl -t             Get current state of idle dim time\n");
    printf("  mac-brightnessctl -t 5           Set idle dim time to 5 seconds\n");
    printf("  mac-brightnessctl -f 5 0.5       Flashing 5 times with interval 0.5 seconds\n");
}

void handleAutoBrightness(int argc, const char *argv[]) {
    if (argc == 3) {
        int autoValue = atoi(argv[2]);
        if (autoValue == 0 || autoValue == 1) {
            [BrightnessControl enableAutoBrightness:autoValue != 0];
            printf("Auto-brightness set to: %s\n", (autoValue != 0) ? "Enabled" : "Disabled");
        } else {
            printf("Error: Invalid input for auto-brightness. Use '1' or '0'\n");
            printUsage();
        }
    } else {
        bool isAutoEnabled = [BrightnessControl isAutoBrightnessEnabled];
        printf("Auto-brightness is: %s\n", isAutoEnabled ? "Enabled" : "Disabled");
    }
}

void handleSuspendIdleDimming(int argc, const char *argv[]) {
    if (argc == 3) {
        int suspendValue = atoi(argv[2]);
        if (suspendValue == 0 || suspendValue == 1) {
            [BrightnessControl setSuspendIdleDimming:suspendValue != 0];
            printf("Idle dimming %s\n", (suspendValue != 0) ? "Disabled" : "Enabled");
        } else {
            printf("Error: Invalid input for suspend idle dimming. Use '1' or '0'\n");
            printUsage();
        }
    } else {
        bool isSuspended = [BrightnessControl isIdleDimmingSuspended];
        printf("Idle dimming is: %s\n", isSuspended ? "Disabled" : "Enabled");
    }
}

void handleIdleDimTime(int argc, const char *argv[]) {
    if (argc == 3) {
        char *endptr;
        double dimTimeValue = strtod(argv[2], &endptr);

        if (*endptr == '\0' && dimTimeValue >= 0.0) {
            [BrightnessControl setIdleDimTime:dimTimeValue];
            printf("Idle dim time set to: %.2f seconds\n", dimTimeValue);
        } else {
            printf("Error: Invalid input for idle dim time. Please provide a valid non-negative number\n");
            printUsage();
        }
    } else {
        printf("Idle dim time set to: %.2f seconds\n", [BrightnessControl idleDimTimeForKeyboard]);
    }
}

void handleSetBrightness(int argc, const char *argv[]) {
    if (argc == 2) {
        char *endptr;
        double brightnessValue = strtod(argv[1], &endptr);

        if (*endptr == '\0' && (strcmp(argv[1], "-") == 0 || (brightnessValue >= 0.0 && brightnessValue <= 1.0))) {
            if (strcmp(argv[1], "-") == 0) {
                printf("Current brightness: %.2f\n", [BrightnessControl getBrightness]);
            } else {
                [BrightnessControl setBrightness:brightnessValue];
                printf("Brightness set to: %.2f\n", brightnessValue);
            }
        } else {
            printf("Error: Invalid input. Please provide a valid number or '-option'\n");
            printUsage();
        }
    } else {
        printf("Error: Invalid number of arguments\n");
        printUsage();
    }
}

void handleFlashKeyboardLights(int argc, const char *argv[]) {
    if (argc == 4) {
        int flashTimes = atoi(argv[2]);
        double flashInterval = atof(argv[3]);

        if (flashTimes > 0 && flashInterval > 0) {
            [BrightnessControl flashKeyboardLights:flashTimes withInterval:flashInterval];
        } else {
            printf("Error: Invalid input for flashing keyboard lights. Ensure both values are positive.\n");
            printUsage();
        }
    } else {
        printf("Error: Invalid number of arguments for flashing keyboard lights\n");
        printUsage();
    }
}
