//
//  NewFlutterViewController.m
//  Runner
//
//  Created by apple on 2020/9/2.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "FlutterViewController.h"
#import "TargetViewController.h"
@interface FlutterViewController ()

@end

@implementation FlutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     FlutterViewController* flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    
    [flutterViewController setInitialRoute:@"landingPage"];
    NSString *channelName = @"com.pages.your/native_get";
       
       FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterViewController];
       
       [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
           // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
           // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
           // result 是给flutter的回调， 该回调只能使用一次
           NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
           
           // method和WKWebView里面JS交互很像
           if ([call.method isEqualToString:@"iOSFlutter"]) {
               TargetViewController *vc = [[TargetViewController alloc] init];
               [self.navigationController pushViewController:vc animated:YES];
           }
           if ([call.method isEqualToString:@"iOSFlutter1"]) {
               NSDictionary *dic = call.arguments;
               NSLog(@"arguments = %@", dic);
               NSString *code = dic[@"code"];
               NSArray *data = dic[@"data"];
               NSLog(@"code = %@", code);
               NSLog(@"data = %@",data);
               NSLog(@"data 第一个元素%@",data[0]);
               NSLog(@"data 第一个元素类型%@",[data[0] class]);
               
           }
           if ([call.method isEqualToString:@"iOSFlutter2"]) {
               if (result) {
                   // iOSFlutter2 对应的方法flutter中主动出发 并且将下面的值（Native的值）传给flutter
                   result(@"这里传值给flutter kongzichixiangjiao");
               }
           }
       }];
   
}




@end
