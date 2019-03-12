//
//  TSKVC.m
//  TVSAccountDemo
//
//  Created by Rinc Liu on 29/1/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "TSKVC.h"
#import <TVSTSKM/TVSTSKM.h>

@interface TSKVC ()

@end

@implementation TSKVC

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

- (IBAction)onClickbtnSendReq:(id)sender {
    [self hideKeyboard];
    if (NotEmpty(_tfPID.text) && NotEmpty(_tfDSN.text) && NotEmpty(_tfDomain.text) && NotEmpty(_tfIntent.text)) {
        __weak typeof(self) weakSelf = self;
        [self checkLogin:^{
            [[TVSTSKM shared]uniAccessWithDeviceSerialNum:weakSelf.tfDSN.text deviceGuid:nil deviceProductId:weakSelf.tfPID.text domain:weakSelf.tfDomain.text intent:weakSelf.tfIntent.text blobInfo:@{@"k":@"v"} handler:^(BOOL success, NSDictionary * result) {
                [self showText:[NSString stringWithFormat:@"请求是否成功:%d\n数据返回:%@", success, result] view:weakSelf.tvResult];
            }];
        }];
    }
}

-(void)hideKeyboard {
    [_tfPID resignFirstResponder];
    [_tfDSN resignFirstResponder];
    [_tfDomain resignFirstResponder];
    [_tfIntent resignFirstResponder];
}

@end
