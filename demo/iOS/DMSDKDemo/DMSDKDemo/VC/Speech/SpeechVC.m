//
//  SpeechVC.m
//  DMSDKDemo
//
//  Created by Rinc Liu on 5/3/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "SpeechVC.h"
#import <TVSSpeech/TVSSpeech.h>

@interface SpeechVC ()

@end

@implementation SpeechVC

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

// 读取 bot 音色配置
- (IBAction)onClickBtnGetBotConfig:(id)sender {
    [self hideKeyboard];
    if (NotEmpty(_tfPid.text)) {
        __weak typeof(self) weakSelf = self;
        [[TVSSpeech shared]getBotAISpeechOptionWithProductId:_tfPid.text handler:^(NSArray<TVSAISpeechItem *> * items) {
            if (items && items.count > 0) {
                for (TVSAISpeechItem* item in items) {
                    [self showConfig:item];
                }
            } else {
                [self showText:@"未读取到bot speech配置" view:weakSelf.tvResult];
            }
        }];
    }
}

// 保存音色配置
- (IBAction)onClickBtnSetSpeechConfig:(id)sender {
    [self hideKeyboard];
    __weak typeof(self) weakSelf = self;
    [self checkLogin:^{
        if (NotEmpty(weakSelf.tfPid.text) && NotEmpty(weakSelf.tfDsn.text) && NotEmpty(weakSelf.tfSpeechId.text) && NotEmpty(weakSelf.tfSpeed.text) && NotEmpty(weakSelf.tfVolume.text)) {
            TVSTTSConfig* tc = [TVSTTSConfig new];
            tc.speed = [weakSelf.tfSpeed.text integerValue];
            tc.volume = [weakSelf.tfVolume.text integerValue];
            [[TVSSpeech shared]setDeviceAISpeechId:weakSelf.tfSpeechId.text ttsConfig:tc productId:weakSelf.tfPid.text dsn:weakSelf.tfDsn.text handler:^(BOOL success) {
                [self showText:[NSString stringWithFormat:@"speech配置保存%@", success?@"成功":@"失败"] view:weakSelf.tvResult];
            }];
        }
    }];
}

// 读取音色配置
- (IBAction)onClickBtnGetSpeechConfig:(id)sender {
    [self hideKeyboard];
    __weak typeof(self) weakSelf = self;
    [self checkLogin:^{
        if (NotEmpty(weakSelf.tfPid.text) && NotEmpty(weakSelf.tfDsn.text)) {
            [[TVSSpeech shared]getDeviceAISpeechWithProductId:weakSelf.tfPid.text dsn:weakSelf.tfDsn.text handler:^(TVSAISpeechItem * item) {
                if (item) {
                    [self showConfig:item];
                } else {
                    [self showText:@"未读取到speech配置" view:weakSelf.tvResult];
                }
            }];
        }
    }];
}

-(void)showConfig:(TVSAISpeechItem*)item {
    [self showText:[NSString stringWithFormat:@"读取到speech配置:\nSpeechId:%@\nSpeechName:%@\nSpeechEnum:%@\nisDefaultOption:%@\nTTSSpeed:%ld\nTTSVolume:%ld", item.speechID, item.speechName, item.speechEnum, item.isDefaultOption, item.ttsConfig?item.ttsConfig.speed:-1, item.ttsConfig?item.ttsConfig.volume:-1] view:_tvResult];
}

-(void)hideKeyboard {
    [_tfVolume resignFirstResponder];
    [_tfSpeed resignFirstResponder];
    [_tfPid resignFirstResponder];
    [_tfDsn resignFirstResponder];
    [_tfSpeechId resignFirstResponder];
}

@end
