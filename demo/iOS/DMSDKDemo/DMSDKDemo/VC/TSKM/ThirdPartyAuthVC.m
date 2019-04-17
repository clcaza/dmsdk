//
//  ThirdPartyAuthVC.m
//  DMSDKDemo
//
//  Created by Rinc Liu on 29/1/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "ThirdPartyAuthVC.h"
#import <TVSTSKM/TVSThirdPartyAuth.h>
#import "BrowserVC.h"

@interface ThirdPartyAuthVC ()

@end

@implementation ThirdPartyAuthVC

- (void)viewDidLoad {
    [super viewDidLoad];
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
                            // 跳转云叮当做第三方账号授权
                            /*[TVSThirdPartyAuth gotoAuthWithAccountInfo:nil deviceInfo:device handler:^(BOOL success) {
                                if (!success) {
                                    [weakSelf showText:@"跳转失败，请安装腾讯云叮当最新版本" view:weakSelf.tvResult];
                                }
                            }];*/
                            // 跳转第三方账号授权 H5
                            BrowserVC* bv = [BrowserVC new];
                            bv.pageType = TVSWebPageTypeThirdPartyAuth;
                            bv.pid = device.productId;
                            bv.dsn = device.dsn;
                            bv.deviceGuid = device.guid;
                            [self.navigationController pushViewController:bv animated:YES];
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
