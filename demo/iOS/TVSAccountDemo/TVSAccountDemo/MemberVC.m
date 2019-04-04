//
//  MemberVC.m
//  TVSAccountDemo
//
//  Created by Rinc Liu on 29/1/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "MemberVC.h"
#import <TVSMember/TVSMember.h>
#import <TVSTSKM/TVSThirdPartyAuth.h>
#import <TVSCore/TVSDevice.h>
#import <TVSCore/TVSAuth.h>

@interface MemberVC ()

@end

@implementation MemberVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onClickBtnQueryMemberStatus:(id)sender {
    [self hideKeyboard];
    if (NotEmpty(_tfPID.text) && NotEmpty(_tfDSN.text)) {
        NSString* label = ((UIButton*)sender).titleLabel.text;
        __weak typeof(self) weakSelf = self;
        [self checkLogin:^{
            TVSMember* mem = [[TVSMember alloc]initWithDeviceProductId:weakSelf.tfPID.text dsn:weakSelf.tfDSN.text];
            if ([label isEqualToString:@"查询领取状态"]) {
                [mem queryDeviceStatusWithType:TVSMemberTypeQQMusic handler:^(BOOL canGet, NSInteger vipTimeNum, TVSMemberUnit vipTimeUnit) {
                    [self showText:[NSString stringWithFormat:@"能否领取会员:%@ 可领取时间数:%ld 可领取时间单位:%ld", canGet?@"YES":@"NO", vipTimeNum, vipTimeUnit] view:weakSelf.tvResult];
                }];
            } else if ([label isEqualToString:@"查询会员状态"]) {
                [mem queryMemberStatusWithType:TVSMemberTypeQQMusic handler:^(BOOL isVip, NSDate* startDate, NSDate* endDate) {
                    NSDateFormatter* df = [NSDateFormatter new];
                    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
                    [self showText:[NSString stringWithFormat:@"是否会员:%@ 会员开始时间:%@ 会员结束时间:%@", isVip?@"是":@"否", startDate?[df stringFromDate:startDate]:@"", endDate?[df stringFromDate:endDate]:@""] view:weakSelf.tvResult];
                }];
            }
        }];
    }
}

// 第三方账号授权
- (IBAction)onClickBtnThirdAuth:(id)sender {
    [self hideKeyboard];
    [self checkLogin:^{
        [[TVSDeviceManager shared]queryDevicesByAccountWithBindType:TVSDeviceBindTypeTVSSpeaker handler:^(NSArray<TVSDeviceInfo *> * devices) {
            if (devices && devices.count > 0) {
                for (TVSDeviceInfo* device in devices) {
                    if ([device.productId isEqualToString:_tfPID.text] && [device.dsn isEqualToString:_tfDSN.text]) {
                        TVSAccountType accountType = [TVSAuthManager shared].accountInfo.accountType;
                        NSURL* url = [TVSThirdPartyAuth urlWithAccountType:accountType productId:device.productId dsn:device.dsn deviceGuid:device.guid];
                        if (url) {
                            [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:^(BOOL success) {
                                if (!success) {
                                    [self showText:@"跳转失败，请安装腾讯云叮当最新版本" view:self.tvResult];
                                }
                            }];
                        } else {
                            [self showText:@"跳转链接获取失败" view:self.tvResult];
                        }
                        break;
                    }
                }
            } else {
                [self showText:@"未查到设备" view:self.tvResult];
            }
        }];
    }];
}

-(void)hideKeyboard {
    [_tfPID resignFirstResponder];
    [_tfDSN resignFirstResponder];
}

@end
