//
//  ViewController.m
//  Runner
//
//  Created by apple on 2020/9/2.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "ViewController.h"
#import "TargetViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushFlutterViewController {
   
    // 设置路由名字 跳转到不同的flutter界面
    /*
    import 'dart:ui';
    
    void main() => runApp(_widgetForRoute(window.defaultRouteName));
    
    Widget _widgetForRoute(String route) {
        switch (route) {
            case 'myApp':
                return new MyApp();
            case 'home':
                return new HomePage();
            default:
                return Center(
                              child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
                              );
        }
    }
    */
    
//    [flutterViewController setInitialRoute:@"home"];
   
    
    // 要与main.dart中一致
    
    
//    [self.navigationController pushViewController:flutterViewController animated:YES];
}
@end
