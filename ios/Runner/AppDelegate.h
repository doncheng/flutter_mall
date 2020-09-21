#import <Flutter/Flutter.h>
#import <UIKit/UIKit.h>
#import "WXApi.h"
#import <AuthenticationServices/AuthenticationServices.h>
@interface AppDelegate : FlutterAppDelegate<UIApplicationDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate, WXApiDelegate,ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding>

@property (nonatomic,strong)UIImagePickerController *imagePickerController;
@property(nonatomic, strong) FlutterResult methodCannelResultBlock;
@end
