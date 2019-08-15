#import "RotationFlutterPlugin.h"

@implementation RotationFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"rotation_flutter"
            binaryMessenger:[registrar messenger]];
  RotationFlutterPlugin* instance = [[RotationFlutterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"forceHorizontal" isEqualToString:call.method]) {
    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeLeft) forKey:@"orientation"];
    result(nil);
  } else if ([@"forceVertical" isEqualToString:call.method]) {
      [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortrait) forKey:@"orientation"];
      result(nil);
  } else if ([@"isKeptOn" isEqualToString:call.method]) {
      bool isIdleTimerDisabled =  [[UIApplication sharedApplication] isIdleTimerDisabled];
      result([NSNumber numberWithBool:isIdleTimerDisabled]);
  }
  else if ([@"keepOn" isEqualToString:call.method]) {
      NSNumber *b = call.arguments[@"on"];
      [[UIApplication sharedApplication] setIdleTimerDisabled:b.boolValue];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
