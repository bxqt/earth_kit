#import "EarthKitPlugin.h"
#if __has_include(<earth_kit/earth_kit-Swift.h>)
#import <earth_kit/earth_kit-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "earth_kit-Swift.h"
#endif

@implementation EarthKitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEarthKitPlugin registerWithRegistrar:registrar];
}
@end
