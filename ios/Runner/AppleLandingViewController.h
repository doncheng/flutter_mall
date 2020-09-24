//
//  AppleLandingViewController.h
//  Runner
//
//  Created by apple on 2020/9/7.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AuthenticationServices/AuthenticationServices.h>//记得引入
NS_ASSUME_NONNULL_BEGIN

@interface AppleLandingViewController : UIViewController<ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding>


@end

NS_ASSUME_NONNULL_END
