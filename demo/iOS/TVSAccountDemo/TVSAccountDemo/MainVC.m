//
//  MainVC.m
//  TVSAccountDemo
//
//  Created by Rinc Liu on 6/3/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "MainVC.h"
#import "AuthVC.h"
#import <TVSCore/TVSEnvironment.h>
#import <TVSCore/TVSAuth.h>

@interface MainVC ()<UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    // 读取后台环境配置
    [_pickerView selectRow:[TVSEnvironment shared].serverEnv inComponent:0 animated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (row) {
        case TVSServerEnvTest: {
            return @"测试环境";
            break;
        }
        case TVSServerEnvExplore: {
            return @"体验环境";
            break;
        }
        case TVSServerEnvFormal: {
            return @"正式环境";
            break;
        }
    }
    return nil;
}

#pragma mark UIPickerViewDelegate

// 由于不同环境账号信息不互通，切换环境后需要重新登录
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if ([TVSAuthManager shared].isQQTokenExist || [TVSAuthManager shared].isWXTokenExist) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"不同环境下账号信息不互通，切换后需要重新登录。确定要切换么？" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            // 注销
            [[TVSAuthManager shared]logout];
            // 保存后台环境配置
            [[TVSEnvironment shared]setServerEnv:row];
            
            AuthVC* vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"AuthVC"];
            vc.fromAlert = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [pickerView selectRow:[TVSEnvironment shared].serverEnv inComponent:0 animated:YES];
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
