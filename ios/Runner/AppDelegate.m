#include "AppDelegate.h"
//#include "GeneratedPluginRegistrant.h"
#import "AppleLandingViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        
    FlutterViewController* flutterViewController = (FlutterViewController*)self.window.rootViewController;
         
         // 要与main.dart中一致
         NSString *channelName = @"example.mall/call_native";
         
         FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterViewController];
         
         [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
             // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
             // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
             // result 是给flutter的回调， 该回调只能使用一次
             NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
             
             if ([call.method isEqualToString:@"WeChatlanding"]) {
                 result(@"ma4444455");
                 
             }
             if ([call.method isEqualToString:@"Applelanding"]) {
                 AppleLandingViewController *appleLandingViewController =[[AppleLandingViewController alloc]init];
                 result(@"ss");
                 
                     
                 
                 
             }
//             if ([call.method isEqualToString:@"iOSFlutter2"]) {
//                 if (result) {
//                     // iOSFlutter2 对应的方法flutter中主动出发 并且将下面的值（Native的值）传给flutter
//                     result(@"这里传值给flutter kongzichixiangjiao");
//                 }
//             }
         }];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
