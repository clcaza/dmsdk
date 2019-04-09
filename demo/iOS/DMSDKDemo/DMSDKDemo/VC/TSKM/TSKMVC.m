//
//  TSKMVC.m
//  DMSDKDemo
//
//  Created by Rinc Liu on 8/4/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "TSKMVC.h"
#import "ThirdPartyAuthVC.h"

@interface TSKMVC ()

@property (nonatomic,strong) TVSDeviceInfo* deviceInfo;

@end

@implementation TSKMVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _deviceInfo = [TVSDeviceInfo new];
}

// 初始化 TVSTSKMProxy
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    [_tfPID resignFirstResponder];
    [_tfDSN resignFirstResponder];
    __weak typeof(self) weakSelf = self;
    [self checkLogin:^{
        if (NotEmpty(weakSelf.tfPID.text) && NotEmpty(weakSelf.tfDSN.text)) {
            weakSelf.deviceInfo.productId = weakSelf.tfPID.text;
            weakSelf.deviceInfo.dsn = weakSelf.tfDSN.text;
            weakSelf.deviceInfo.bindType = TVSDeviceBindTypeTVSSpeaker;
            [weakSelf delegate].tskmProxy = [[TVSTSKMProxy alloc] initWithDeviceInfo:weakSelf.deviceInfo accountInfo:nil];
        }
    }];
    return ([TVSAuthManager shared].isQQTokenExist || [TVSAuthManager shared].isWXTokenExist) && NotEmpty(weakSelf.tfPID.text) && NotEmpty(weakSelf.tfDSN.text);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // 第三方授权需要设备信息
    if ([segue.destinationViewController isKindOfClass:[ThirdPartyAuthVC class]]) {
        ThirdPartyAuthVC* vc = (ThirdPartyAuthVC*)segue.destinationViewController;
        vc.deviceInfo = _deviceInfo;
    }
}

@end
