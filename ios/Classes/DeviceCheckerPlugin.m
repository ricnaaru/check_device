#import "DeviceCheckerPlugin.h"
#import <device_checker/device_checker-Swift.h>

@implementation DeviceCheckerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceCheckerPlugin registerWithRegistrar:registrar];
}
@end
