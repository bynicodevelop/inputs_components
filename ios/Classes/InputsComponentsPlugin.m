#import "InputsComponentsPlugin.h"
#if __has_include(<inputs_components/inputs_components-Swift.h>)
#import <inputs_components/inputs_components-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "inputs_components-Swift.h"
#endif

@implementation InputsComponentsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftInputsComponentsPlugin registerWithRegistrar:registrar];
}
@end
