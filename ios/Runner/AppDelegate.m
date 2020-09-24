#include "AppDelegate.h"
//#include "GeneratedPluginRegistrant.h"
#import "AppleLandingViewController.h"

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
             
             if ([call.method isEqualToString:@"SystemVersion"]) {
                 NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
                 result(phoneVersion);
                 
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
//                 if (@available(iOS 13.0, *)) {
//
//                     [self Applelanding];
//
//                 } else {
//                     // Fallback on earlier versions
//                 }
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

#pragma mark -Apple
//-(void)authorizationStatus{
//    if (@available(iOS 13.0, *)) {
////        NSString *userIdentifier = 钥匙串中取出的 userIdentifier;
//        NSString *userIdentifier = userIdentifier;
//        if (userIdentifier) {
//            ASAuthorizationAppleIDProvider *appleIDProvider = [ASAuthorizationAppleIDProvider new];
//            [appleIDProvider getCredentialStateForUserID:userIdentifier
//                                              completion:^(ASAuthorizationAppleIDProviderCredentialState credentialState,
//                                                           NSError * _Nullable error)
//            {
//                switch (credentialState) {
////                    授权状态有效；
//                    case ASAuthorizationAppleIDProviderCredentialAuthorized:
//                        // The Apple ID credential is valid
//                        break;
////                        上次使用苹果账号登录的凭据已被移除，需解除绑定并重新引导用户使用苹果登录；
//                    case ASAuthorizationAppleIDProviderCredentialRevoked:
//                        // Apple ID Credential revoked, handle unlink
//                        break;
////                        未登录授权，直接弹出登录页面，引导用户登录。
//                    case ASAuthorizationAppleIDProviderCredentialNotFound:
//                        // Credential not found, show login UI
//                        break;
//                    case ASAuthorizationAppleIDProviderCredentialTransferred:
//                        //
//                        break;
//                }
//            }];
//        }
//    }
//}

//Authorization 发起授权登录请求
//-(void)Applelanding API_AVAILABLE(ios(13.0)){
//    //ASAuthorizationAppleIDProvider主要用于创建一个 ASAuthorizationAppleIDRequest 以及获取对应 userID 的用户授权状态
//    ASAuthorizationAppleIDProvider *appleIDProvider = [[ASAuthorizationAppleIDProvider alloc]init];
//    ASAuthorizationAppleIDRequest *request = [appleIDProvider createRequest];
//    request.requestedScopes = @[ASAuthorizationScopeFullName,ASAuthorizationScopeEmail];
//    //创建 ASAuthorizationController ，它是管理授权请求的控制器
//    ASAuthorizationController *auth = [[ASAuthorizationController alloc]initWithAuthorizationRequests:@[request]];
//    auth.delegate = self;
//    auth.presentationContextProvider = self;
//    //启动授权 performRequests
//    [auth performRequests];
//}
////已经Sign In with Apple登陆过app的用户,如果设备中存在iCloud Keychain凭证或者AppleID凭证，提示用户直接使用TouchID或FaceID登录即可。
//- (void)perfomExistingAccountSetupFlows {
//    if (@available(iOS 13.0, *)) {
//
//        // 授权请求依赖于用于的AppleID
//        ASAuthorizationAppleIDRequest *authAppleIDRequest = [[ASAuthorizationAppleIDProvider new] createRequest];
//        // 为了执行钥匙串凭证分享生成请求的一种机制
//        ASAuthorizationPasswordRequest *passwordRequest = [[ASAuthorizationPasswordProvider new] createRequest];
//        NSMutableArray <ASAuthorizationRequest *> *mArr = [NSMutableArray arrayWithCapacity:2];
//        if (authAppleIDRequest) {
//            [mArr addObject:authAppleIDRequest];
//        }
//        if (passwordRequest) {
//            [mArr addObject:passwordRequest];
//        }
//        // ASAuthorizationRequest：对于不同种类授权请求的基类
//        NSArray <ASAuthorizationRequest *> *requests = [mArr copy];
//        // 由ASAuthorizationAppleIDProvider创建的授权请求 管理授权请求的控制器
//        ASAuthorizationController *authorizationController = [[ASAuthorizationController alloc] initWithAuthorizationRequests:requests];
//        // 设置授权控制器通知授权请求的成功与失败的代理
//        authorizationController.delegate = self;
//        // 设置提供 展示上下文的代理，在这个上下文中 系统可以展示授权界面给用户
//        authorizationController.presentationContextProvider = self;
//        // 在控制器初始化期间启动授权流
//        [authorizationController performRequests];
//    }
//}
//
/////告诉 ASAuthorizationController 展示在哪个 window 上。
//-(ASPresentationAnchor)presentationAnchorForAuthorizationController:(ASAuthorizationController *)controller API_AVAILABLE(ios(13.0)){
////    return self.view.window;
//    return [UIApplication sharedApplication].delegate.window;
////    return self.window;
//}
//
//- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization API_AVAILABLE(ios(13.0))
//{
//    if ([authorization.credential isKindOfClass:[ASAuthorizationAppleIDCredential class]])       {
//        ASAuthorizationAppleIDCredential *credential = authorization.credential;
//
//        ///将返回得到的user 存储起来
//        NSString *state = credential.state;
//        NSString *userID = credential.user;
//        NSPersonNameComponents *fullName = credential.fullName;
//        NSString *email = credential.email;
//        NSString *authorizationCode = [[NSString alloc] initWithData:credential.authorizationCode encoding:NSUTF8StringEncoding]; // refresh token
//        NSString *identityToken = [[NSString alloc] initWithData:credential.identityToken encoding:NSUTF8StringEncoding]; // access token
//        ASUserDetectionStatus realUserStatus = credential.realUserStatus;
//
//        NSLog(@"state: %@", state);
//        NSLog(@"userID: %@", userID);
//        NSLog(@"fullName: %@", fullName);
//        NSLog(@"email: %@", email);
//        NSLog(@"authorizationCode: %@", authorizationCode);
//        NSLog(@"identityToken: %@", identityToken);
//        NSLog(@"realUserStatus: %@", @(realUserStatus));
//    }
//}
//
//- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error API_AVAILABLE(ios(13.0))
//{
//    NSString *errorMsg = nil;
//    switch (error.code) {
//        case ASAuthorizationErrorCanceled:
//            errorMsg = @"用户取消了授权请求";
//            break;
//        case ASAuthorizationErrorFailed:
//            errorMsg = @"授权请求失败";
//            break;
//        case ASAuthorizationErrorInvalidResponse:
//            errorMsg = @"授权请求响应无效";
//            break;
//        case ASAuthorizationErrorNotHandled:
//            errorMsg = @"未能处理授权请求";
//            break;
//        case ASAuthorizationErrorUnknown:
//            errorMsg = @"授权请求失败未知原因";
//            break;
//    }
//    NSLog(@"%@", errorMsg);
//}
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
        
        [[NSUserDefaults standardUserDefaults] setObject:userID forKey:@"appleID"];
        [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"authorizationCode%@",authorizationCode]
                                    message:[NSString stringWithFormat:@"identityToken%@",identityToken]
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
        NSLog(@"userID: %@", userID);
        NSLog(@"fullName: %@", fullName);
        NSLog(@"email: %@", email);
        NSLog(@"authorizationCode: %@", authorizationCode);
        NSLog(@"identityToken: %@", identityToken);
        NSLog(@"realUserStatus: %@", @(realUserStatus));
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
