//
//  AuthVC.m
//  TvsLoginDemo
//
//  Created by Rinc Liu on 2019/1/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "AuthVC.h"

#import <TVSCore/TVSAuth.h>

@implementation AuthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [_loadingView startAnimating];
    _loadingView.hidden = YES;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self refreshBtnStatus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)disableButtons {
    _loadingView.hidden = NO;
    _btnAccountInfo.enabled = NO;
    _btnUserInfo.enabled = NO;
    _btnWXLogin.enabled = NO;
    _btnWXToken.enabled = NO;
    _btnQQLogin.enabled = NO;
    _btnQQToken.enabled = NO;
    _btnLogout.enabled = NO;
}

//查询登录状态
-(void)refreshBtnStatus {
    _loadingView.hidden = YES;
    _btnAccountInfo.enabled = YES;
    _btnUserInfo.enabled = YES;
    if ([[TVSAuthManager shared]isWXTokenExist]) {//是否微信登录
        _btnWXLogin.enabled = NO;
        _btnWXToken.enabled = YES;
        _btnQQLogin.enabled = NO;
        _btnQQToken.enabled = NO;
        _btnLogout.enabled = YES;
    } else if ([[TVSAuthManager shared]isQQTokenExist]) {//是否QQ登录
        _btnWXLogin.enabled = NO;
        _btnWXToken.enabled = NO;
        _btnQQLogin.enabled = NO;
        _btnQQToken.enabled = YES;
        _btnLogout.enabled = YES;
    } else {//未登录
        _btnWXLogin.enabled = YES;
        _btnWXToken.enabled = NO;
        _btnQQLogin.enabled = YES;
        _btnQQToken.enabled = NO;
        _btnLogout.enabled = NO;
        _btnAccountInfo.enabled = NO;
        _btnUserInfo.enabled = NO;
    }
}

//调用微信登录
- (IBAction)onClickBtnWXLogin:(id)sender {
    [self disableButtons];
    __weak typeof(self) weakSelf = self;
    [[TVSAuthManager shared]wxLoginWithViewController:self handler:^(TVSAuthResult result){
        [self showText:[NSString stringWithFormat:@"微信登录%@", result == TVSAuthResultSuccess ? @"成功" : @"失败"] view:weakSelf.tvResult];
        [self refreshBtnStatus];
        if (weakSelf.fromAlert && result == TVSAuthResultSuccess) [self.navigationController popViewControllerAnimated:YES];
    }];
}

//刷新微信token(已登录情况下)
- (IBAction)onClickBtnWXToken:(id)sender {
    [self disableButtons];
    __weak typeof(self) weakSelf = self;
    [[TVSAuthManager shared]wxTokenRefreshWithHandler:^(TVSAuthResult result){
        [self showText:[NSString stringWithFormat:@"微信 token 刷新%@", result == TVSAuthResultSuccess ? @"成功" : @"失败"] view:weakSelf.tvResult];
        [self refreshBtnStatus];
    }];
}

//调用QQ登录
- (IBAction)onClickQQLogin:(id)sender {
    [self disableButtons];
    __weak typeof(self) weakSelf = self;
    [[TVSAuthManager shared]qqLoginWithHandler:^(TVSAuthResult result){
        [self showText:[NSString stringWithFormat:@"QQ 登录%@",  result == TVSAuthResultSuccess ? @"成功" : @"失败"] view:weakSelf.tvResult];
        [self refreshBtnStatus];
        if (weakSelf.fromAlert && result == TVSAuthResultSuccess) [self.navigationController popViewControllerAnimated:YES];
    }];
}

//验证QQ token(已登录情况下)
- (IBAction)onClickQQToken:(id)sender {
    [self disableButtons];
    __weak typeof(self) weakSelf = self;
    [[TVSAuthManager shared]qqTokenVerifyWithHandler:^(TVSAuthResult result){
        [self showText:[NSString stringWithFormat:@"QQ token 验证%@",  result == TVSAuthResultSuccess ? @"成功" : @"失败"] view:weakSelf.tvResult];
        [self refreshBtnStatus];
    }];
}

//读取账号信息
- (IBAction)onClickBtnAccountInfo:(id)sender {
    TVSAccountInfo* ai = [TVSAuthManager shared].accountInfo;
    NSString* clientId = [TVSAccountInfo clientIdWithProductId:@"mProductId" dsn:@"mDSN"];
    [self showText:[NSString stringWithFormat:@"appId: %@",  ai.appId] view:_tvResult];
    [self showText:[NSString stringWithFormat:@"openId: %@",  ai.openId] view:_tvResult];
    [self showText:[NSString stringWithFormat:@"tvsId: %@",  ai.tvsId] view:_tvResult];
    [self showText:[NSString stringWithFormat:@"accessToken: %@",  ai.accessToken] view:_tvResult];
    [self showText:[NSString stringWithFormat:@"refreshToken: %@",  ai.refreshToken] view:_tvResult];
    [self showText:[NSString stringWithFormat:@"userId: %@",  ai.userId] view:_tvResult];
    [self showText:[NSString stringWithFormat:@"clientId: %@",  clientId] view:_tvResult];
}

//读取用户信息
- (IBAction)onClickBtnUserInfo:(id)sender {
    TVSUserInfo* ui = [TVSAuthManager shared].userInfo;
    [self showText:[NSString stringWithFormat:@"nickname: %@",  ui.nickName] view:_tvResult];
    [self showText:[NSString stringWithFormat:@"gender: %@",  ui.sex?@"男":@"女"] view:_tvResult];
    [self showText:[NSString stringWithFormat:@"avatar: %@",  ui.headImgUrl] view:_tvResult];
    [self showText:[NSString stringWithFormat:@"phoneNumber: %@",  ui.phoneNumber] view:_tvResult];
}

//注销登录
- (IBAction)onClickBtnLogout:(id)sender {
    [[TVSAuthManager shared]logout];
    [self refreshBtnStatus];
    _tvResult.text = nil;
}

@end
