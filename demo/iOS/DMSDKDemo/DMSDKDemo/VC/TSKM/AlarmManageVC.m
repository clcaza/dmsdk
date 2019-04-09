//
//  AlarmManageVC.m
//  DMSDKDemo
//
//  Created by Rinc Liu on 8/4/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "AlarmManageVC.h"
#import <TVSTSKM/TVSAlarmManager.h>

@interface AlarmManageVC ()

@property(nonatomic,strong) TVSAlarmManager* alarmManager;

@end

@implementation AlarmManageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _alarmManager = [[TVSAlarmManager alloc]initWithTSKMProxy:[self delegate].tskmProxy];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// 闹钟管理
- (IBAction)onClickBtnSendReq:(id)sender {
    [_tvBlob resignFirstResponder];
    __weak typeof(self) weakSelf = self;
    if (NotEmpty(_tvBlob.text)) {
        [_alarmManager manageWithJsonBlob:[self dictFromJson:_tvBlob.text] handler:^(BOOL success, NSDictionary * result) {
            if (success) {
                if (result) {
                    [weakSelf showText:[NSString stringWithFormat:@"闹钟管理成功:\n%@", result] view:weakSelf.tvResult];
                } else {
                    [weakSelf showText:@"闹钟管理成功" view:weakSelf.tvResult];
                }
            } else {
                [weakSelf showText:@"闹钟管理失败" view:weakSelf.tvResult];
            }
        }];
    }
}

@end
