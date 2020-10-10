#include "AppDelegate.h"
//#include "GeneratedPluginRegistrant.h"
#import "AppleLandingViewController.h"
#import <AdSupport/AdSupport.h>
#import "UICKeyChainStore.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    FlutterViewController* flutterViewController = (FlutterViewController*)self.window.rootViewController;
    self.flutterViewController = flutterViewController;
         // 要与main.dart中一致
         NSString *channelName = @"example.mall/call_native";
         
         FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterViewController];
         
         [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
             // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
             // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
             // result 是给flutter的回调， 该回调只能使用一次
             NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
             
             //系统版本
             if ([call.method isEqualToString:@"SystemVersion"]) {
                 NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
                 result(phoneVersion);
             }
       
             //软件build
                         if ([call.method isEqualToString:@"PackageBuild"]) {
                            NSString* packageBuild = [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleVersion"];
                                        result(packageBuild);
                                    }
             //软件版本
              if ([call.method isEqualToString:@"PackageVersion"]) {
                 NSString* packageVersion = [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleShortVersionString"];
                             result(packageVersion);
                         }
             //设备id
                        if ([call.method isEqualToString:@"device_id"]) {
                           
                            UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:@"com.JiaoYiBei"];
                             
                            NSString* device_id = [UIDevice currentDevice].identifierForVendor.UUIDString;
                            [keychain setString:device_id forKey:@"device_id"];
                            
                                       result(device_id);
                                   }
             
             //设备idfa
                                if ([call.method isEqualToString:@"idfa"]) {
                                  NSString *idfa =   [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
                                               result(idfa);
                                           }
             
             //model
             if ([call.method isEqualToString:@"model"]) {
                 NSString *model = [[UIDevice currentDevice] name];
                        result(model);
               }
             
        
             if ([call.method isEqualToString:@"WeChatlanding"]) {
                 result(@"微信登陆");
             }
             
             if ([call.method isEqualToString:@"Applelanding"]) {
                 [[[UIAlertView alloc] initWithTitle:@"Applelanding"
                                             message:@"Camera not available."
                                            delegate:nil
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil] show];
//                 UIWindow *window = self.rootViewController.view.window;
                 //Apple登陆状态
//                 [self authorizationStatus];
                 
//                 AppleLandingViewController *appleLandingViewController = [[AppleLandingViewController alloc]init];
// [self.rootViewController presentViewController:appleLandingViewController animated:YES completion:nil];
                  [self authorizationAppleID];
                 self.result = result;
             }
             
             //访问相册 相机
             if ([call.method isEqualToString:@"visitAlbum"]) {
                 //拿到回调block，回传照片时用 = result;
                 self.methodCannelResultBlock = result;
                 [self visitAlbum];
             }
                          
             //例子
             //             if ([call.method isEqualToString:@"iOSFlutter"]) {
             //                   TargetViewController *vc = [[TargetViewController alloc] init];
             //                   [self.navigationController pushViewController:vc animated:YES];
             //               }
                          
             //             if ([call.method isEqualToString:@"iOSFlutter1"]) {
             //                        NSDictionary *dic = call.arguments;
             //                        NSLog(@"arguments = %@", dic);
             //                        NSString *code = dic[@"code"];
             //                        NSArray *data = dic[@"data"];
             //                        NSLog(@"code = %@", code);
             //                        NSLog(@"data = %@",data);
             //                        NSLog(@"data 第一个元素%@",data[0]);
             //                        NSLog(@"data 第一个元素类型%@",[data[0] class]);
             //
             //                    }
             
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

#pragma mark -
- (UIViewController*)rootViewController{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (rootViewController.presentedViewController) {
        rootViewController = rootViewController.presentedViewController;
    }
    return rootViewController;
}

//点击空白收起presentview
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)eventv
{
    [self.rootViewController dismissViewControllerAnimated:YES completion:nil];
}


-(void)visitAlbum{
    //UIAlertControllerStyleAlert弹窗在屏幕中间，UIAlertControllerStyleActionSheet弹窗在屏幕下面
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"选取图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cameraAction=[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.imagePickerController.sourceType=UIImagePickerControllerSourceTypeCamera;
        self.imagePickerController.cameraDevice=UIImagePickerControllerCameraDeviceRear;
        [self.rootViewController  presentViewController:self.imagePickerController animated:YES completion:nil];
    }];
    
    UIAlertAction *photosAlbumAction=[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.imagePickerController.sourceType=UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [self.rootViewController presentViewController:self.imagePickerController animated:YES completion:nil];
    }];
    
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.rootViewController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:photosAlbumAction];
    [alert addAction:cameraAction];
    [alert addAction:cancelAction];
    
    [self.rootViewController presentViewController:alert animated:YES completion:nil];
    
}
#pragma mark -imagePickerController
- (UIImagePickerController *)imagePickerController{
    if (_imagePickerController==nil) {
        _imagePickerController=[[UIImagePickerController alloc]init];
        _imagePickerController.delegate=self;
        _imagePickerController.allowsEditing=YES;
    }
    return _imagePickerController;
}
//拿到图片的回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    //编辑后的照片
    UIImage *image = info[UIImagePickerControllerEditedImage];
    NSData *imageData = UIImagePNGRepresentation(image);
    self.methodCannelResultBlock(imageData);
}

#pragma mark- 授权苹果ID
- (void)authorizationAppleID {
    
    if (@available(iOS 13.0, *)) {
        
        ASAuthorizationAppleIDProvider * appleIDProvider = [[ASAuthorizationAppleIDProvider alloc] init];
        ASAuthorizationAppleIDRequest * authAppleIDRequest = [appleIDProvider createRequest];
        ASAuthorizationPasswordRequest * passwordRequest = [[[ASAuthorizationPasswordProvider alloc] init] createRequest];

        NSMutableArray <ASAuthorizationRequest *> * array = [NSMutableArray arrayWithCapacity:2];
        if (authAppleIDRequest) {
            [array addObject:authAppleIDRequest];
        }
//        if (passwordRequest) {
//            [array addObject:passwordRequest];
//        }
        NSArray <ASAuthorizationRequest *> * requests = [array copy];
        
        ASAuthorizationController * authorizationController = [[ASAuthorizationController alloc] initWithAuthorizationRequests:requests];
        authorizationController.delegate = self;
        authorizationController.presentationContextProvider = self;
        [authorizationController performRequests];
        
    } else {
        // 处理不支持系统版本
        NSLog(@"系统不支持Apple登录");
    }
}
#pragma mark- ASAuthorizationControllerDelegate
// 授权成功
- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization API_AVAILABLE(ios(13.0)) {
    
    if ([authorization.credential isKindOfClass:[ASAuthorizationAppleIDCredential class]]) {
        
        ASAuthorizationAppleIDCredential * credential = authorization.credential;
        
        // 苹果用户唯一标识符，该值在同一个开发者账号下的所有 App 下是一样的，开发者可以用该唯一标识符与自己后台系统的账号体系绑定起来。
        NSString * userID = credential.user;
        
        // 苹果用户信息 如果授权过，可能无法再次获取该信息
        NSPersonNameComponents * fullName = credential.fullName;
        NSString * email = credential.email;
        
        // 服务器验证需要使用的参数
        NSString * authorizationCode = [[NSString alloc] initWithData:credential.authorizationCode encoding:NSUTF8StringEncoding];
        NSString * identityToken = [[NSString alloc] initWithData:credential.identityToken encoding:NSUTF8StringEncoding];
        
        // 用于判断当前登录的苹果账号是否是一个真实用户，取值有：unsupported、unknown、likelyReal
        ASUserDetectionStatus realUserStatus = credential.realUserStatus;
//        NSLog(@"userID: %@", userID);
        NSLog(@"fullName: %@", fullName);
//        NSLog(@"email: %@", email);
//        NSLog(@"authorizationCode: %@", authorizationCode);
//        NSLog(@"identityToken: %@", identityToken);
//        NSLog(@"realUserStatus: %@", @(realUserStatus));

        self.result ([NSString stringWithFormat:@"jwt=%@&sub=%@",identityToken,userID]);
        
       
        //测试弹窗
        [[NSUserDefaults standardUserDefaults] setObject:userID forKey:@"appleID"];
        [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"authorizationCode%@",authorizationCode]
//                                    message:[NSString stringWithFormat:@"identityToken%@",identityToken]
                                    message:@"success"
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
    else if ([authorization.credential isKindOfClass:[ASPasswordCredential class]]) {
        
        // 用户登录使用现有的密码凭证
        ASPasswordCredential * passwordCredential = authorization.credential;
        // 密码凭证对象的用户标识 用户的唯一标识
        NSString * user = passwordCredential.user;
        // 密码凭证对象的密码
        NSString * password = passwordCredential.password;
        
        NSLog(@"userID: %@", user);
        NSLog(@"password: %@", password);
        
    } else {
        
    }
}

// 授权失败
- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error API_AVAILABLE(ios(13.0)) {
    
    NSString *errorMsg = nil;
    
    switch (error.code) {
        case ASAuthorizationErrorCanceled:
            errorMsg = @"用户取消了授权请求";
            break;
        case ASAuthorizationErrorFailed:
            errorMsg = @"授权请求失败";
            break;
        case ASAuthorizationErrorInvalidResponse:
            errorMsg = @"授权请求响应无效";
            break;
        case ASAuthorizationErrorNotHandled:
            errorMsg = @"未能处理授权请求";
            break;
        case ASAuthorizationErrorUnknown:
            errorMsg = @"授权请求失败未知原因";
            break;
    }
    NSLog(@"%@", errorMsg);
    self.result(@"授权失败");
}

#pragma mark- ASAuthorizationControllerPresentationContextProviding
- (ASPresentationAnchor)presentationAnchorForAuthorizationController:(ASAuthorizationController *)controller {
    
    return self.rootViewController.view.window;
}

#pragma mark- apple授权状态 更改通知
- (void)handleSignInWithAppleStateChanged:(NSNotification *)notification
{
    NSLog(@"%@", notification.userInfo);
}
@end
