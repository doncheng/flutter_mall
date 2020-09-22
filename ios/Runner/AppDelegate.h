#import <Flutter/Flutter.h>
#import <UIKit/UIKit.h>
#import "WXApi.h"
#import <AuthenticationServices/AuthenticationServices.h>
API_AVAILABLE(ios(13.0))
@interface AppDelegate : FlutterAppDelegate<UIApplicationDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate, WXApiDelegate,ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding>


@property (nonatomic,strong)UIImagePickerController *imagePickerController;
@property(nonatomic, strong) FlutterResult methodCannelResultBlock;
@property (nonatomic,strong) ASAuthorizationAppleIDButton *authorizationButton;

@end


//apple登陆的协议
//-- ASAuthorizationControllerDelegate 处理数据回调
// --ASAuthorizationControllerPresentationContextProviding 设置上下文，管理视图弹出在哪里
