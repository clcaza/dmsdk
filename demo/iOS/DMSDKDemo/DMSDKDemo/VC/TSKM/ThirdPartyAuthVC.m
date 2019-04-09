//
//  ThirdPartyAuthVC.m
//  DMSDKDemo
//
//  Created by Rinc Liu on 29/1/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "ThirdPartyAuthVC.h"
#import <TVSTSKM/TVSThirdPartyAuth.h>

@interface ThirdPartyAuthVC ()

@property(nonatomic,strong) TVSThirdPartyAuth* auth;

@end

@implementation ThirdPartyAuthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _auth = [[TVSThirdPartyAuth alloc]initWithTSKMProxy:[self delegate].tskmProxy];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// 拉起云叮当进行第三方账号授权
- (IBAction)onClickBtnAuth:(id)sender {
    __weak typeof(self) weakSelf = self;
    // 绑定设备
    [[TVSDeviceManager shared]bindDevice:_deviceInfo handler:^(BOOL success) {
        if (success) {
            // 查询设备，获取 GUID
            [[TVSDeviceManager shared]queryDevicesByAccountWithBindType:weakSelf.deviceInfo.bindType handler:^(NSArray<TVSDeviceInfo *> * devices) {
                if (devices && devices.count > 0) {
                    for (TVSDeviceInfo* device in devices) {
                        if ([device.productId isEqualToString:weakSelf.deviceInfo.productId] && [device.dsn isEqualToString:weakSelf.deviceInfo.dsn]) {
                            TVSAccountType accountType = [TVSAuthManager shared].accountInfo.accountType;
                            // 通过设备信息和 GUID 拼接云叮当授权跳转链接
                            NSURL* url = [TVSThirdPartyAuth urlWithAccountType:accountType productId:device.productId dsn:device.dsn deviceGuid:device.guid];
                            if (url) {
                                // 打开链接
                                [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:^(BOOL success) {
                                    if (!success) {
                                        [weakSelf showText:@"跳转失败，请安装腾讯云叮当最新版本" view:weakSelf.tvResult];
                                    }
                                }];
                            } else {
                                [weakSelf showText:@"跳转链接获取失败" view:weakSelf.tvResult];
                            }
                            return;
                        }
                    }
                }
                [weakSelf showText:@"设备查询失败" view:weakSelf.tvResult];
            }];
        } else {
            [weakSelf showText:@"设备绑定失败" view:weakSelf.tvResult];
        }
    }];
}

@end
