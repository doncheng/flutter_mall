#import <Flutter/Flutter.h>
#import <UIKit/UIKit.h>
#import "WXApi.h"
#import <AuthenticationServices/AuthenticationServices.h>
@interface AppDelegate : FlutterAppDelegate<UIApplicationDelegate, WXApiDelegate,ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding>

@end
