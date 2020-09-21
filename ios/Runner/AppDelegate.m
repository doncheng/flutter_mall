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
                 result(@"微信登陆");
                 
             }
             if ([call.method isEqualToString:@"Applelanding"]) {
                 if (@available(iOS 13.0, *)) {
                     
                     [self Applelanding];
                     
                 } else {
                     // Fallback on earlier versions
                 }
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

#pragma mark -AppleLanding
-(void)Applelanding API_AVAILABLE(ios(13.0)){
    ASAuthorizationAppleIDProvider *appleIDProvider = [[ASAuthorizationAppleIDProvider alloc]init];
    ASAuthorizationAppleIDRequest *request = [appleIDProvider createRequest];
    request.requestedScopes = @[ASAuthorizationScopeFullName,ASAuthorizationScopeEmail];
    ASAuthorizationController *auth = [[ASAuthorizationController alloc]initWithAuthorizationRequests:@[request]];
    auth.delegate = self;
    auth.presentationContextProvider = self;
    [auth performRequests];
}

///代理主要用于展示在哪里
//-(ASPresentationAnchor)presentationAnchorForAuthorizationController:(ASAuthorizationController *)controller API_AVAILABLE(ios(13.0)){
//    return self.rootViewController;
//}

-(void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization API_AVAILABLE(ios(13.0)){
        if([authorization.credential isKindOfClass:[ASAuthorizationAppleIDCredential class]]){
            ASAuthorizationAppleIDCredential *apple = authorization.credential;
            ///将返回得到的user 存储起来
            NSString *userIdentifier = apple.user;
            NSPersonNameComponents *fullName = apple.fullName;
            NSString *email = apple.email;
            //用于后台像苹果服务器验证身份信息
            NSData *identityToken = apple.identityToken;
            
            
            NSLog(@"%@%@%@%@",userIdentifier,fullName,email,identityToken);
        }else if ([authorization.credential isKindOfClass:[ASPasswordCredential class]]){
            
            //// Sign in using an existing iCloud Keychain credential.
            ASPasswordCredential *pass = authorization.credential;
            NSString *username = pass.user;
            NSString *passw = pass.password;
            
        }
    
}

///回调失败
-(void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error API_AVAILABLE(ios(13.0)){
    NSLog(@"%@",error);
}
@end
