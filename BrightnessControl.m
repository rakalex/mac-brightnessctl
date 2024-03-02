#import "BrightnessControl.h"
#import "KeyboardManager.h"

@implementation BrightnessControl

+ (void)setBrightness:(float)brightness {
    [KeyboardManager.brightnessClient setBrightness:brightness forKeyboard:1];
}

+ (float)getBrightness {
    return [KeyboardManager.brightnessClient brightnessForKeyboard:1];
}

+ (bool)isAutoBrightnessEnabled {
    return [KeyboardManager.brightnessClient isAutoBrightnessEnabledForKeyboard:1];
}

+ (bool)isIdleDimmingSuspended {
    return [KeyboardManager.brightnessClient isIdleDimmingSuspendedOnKeyboard:1];
}

+ (void)setSuspendIdleDimming:(bool)value {
    [KeyboardManager.brightnessClient suspendIdleDimming:value forKeyboard:1];
}

+ (void)setIdleDimTime:(double)value {
    [KeyboardManager.brightnessClient setIdleDimTime:value forKeyboard:1];
}

+ (double)idleDimTimeForKeyboard {
    return [KeyboardManager.brightnessClient idleDimTimeForKeyboard:1];
}

+ (void)enableAutoBrightness:(bool)value {
    [KeyboardManager.brightnessClient enableAutoBrightness:value forKeyboard:1];
}

+ (void)flashKeyboardLights:(int)times withInterval:(double)interval {
    float current = [self getBrightness];
    for (int i = 0; i < times; i++) {
        [self setBrightness:0];
        [NSThread sleepForTimeInterval:interval];
        [self setBrightness:1];
        [NSThread sleepForTimeInterval:interval];
    }
    [self setBrightness:current];
}

@end
