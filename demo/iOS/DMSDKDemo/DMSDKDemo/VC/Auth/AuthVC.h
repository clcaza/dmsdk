//
//  AuthVC.h
//  TvsLoginDemo
//
//  Created by Rinc Liu on 2019/1/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "BaseVC.h"

@interface AuthVC : BaseVC

@property (strong, nonatomic) IBOutlet UIButton *btnWXLogin;
@property (strong, nonatomic) IBOutlet UIButton *btnWXToken;
@property (strong, nonatomic) IBOutlet UIButton *btnQQLogin;
@property (strong, nonatomic) IBOutlet UIButton *btnQQToken;
@property (strong, nonatomic) IBOutlet UITextView *tvResult;
@property (strong, nonatomic) IBOutlet UIButton *btnLogout;
@property (strong, nonatomic) IBOutlet UIButton *btnAccountInfo;
@property (strong, nonatomic) IBOutlet UIButton *btnUserInfo;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;

@property(nonatomic,assign) BOOL fromAlert;

@end

