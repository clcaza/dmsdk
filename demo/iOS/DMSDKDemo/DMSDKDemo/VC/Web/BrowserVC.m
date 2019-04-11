//
//  BrowserVC.m
//  DMSDKDemo
//
//  Created by Rinc Liu on 8/3/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "BrowserVC.h"

@interface BrowserVC()<TVSWebUniversalDelegate, TVSWebBusinessDelegate>

@property(nonatomic,strong) UIView* vNav;
@property(nonatomic,strong) UIButton *btnBack, *btnReload, *btnStop, *btnForward;
@property(nonatomic,strong) UIProgressView* progressView;
@property(nonatomic,strong) TVSWebView* webview;

@end

@implementation BrowserVC

-(void)viewDidLoad {
    [super viewDidLoad];
    
    _vNav = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
    _btnBack = [self newButtonX:0 title:@"←" sel:@selector(onClickBtnBack:)];
    _btnReload = [self newButtonX:30 title:@"↺" sel:@selector(onClickBtnReload:)];
    _btnStop = [self newButtonX:60 title:@"✗" sel:@selector(onClickBtnStop:)];
    _btnForward = [self newButtonX:90 title:@"→" sel:@selector(onClickBtnForward:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_vNav];
    
    _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height+self.navigationController.navigationBar.frame.size.height, self.view.bounds.size.width, 1)];
    _progressView.hidden = YES;
    [self.view addSubview:_progressView];
    
    // 添加 TVSWebView
    _webview = [[TVSWebView alloc] initWithFrame:self.view.bounds];
    _webview.webUniversalDelegate = self;
    _webview.webBusinessDelegate = self;
    // QQ 音乐会员相关页面需要设备信息
    _webview.device = [TVSDeviceInfo new];
    _webview.device.bindType = TVSDeviceBindTypeTVSSpeaker;
    _webview.device.pushIdExtra = PUSH_ID_EXTRA_TVS_SPEAKER;
    _webview.device.deviceType = @"ScreenSpeaker";
    _webview.device.deviceOEM = @"TencentDingdang";
    _webview.device.productId = _pid;
    _webview.device.dsn = _dsn;
    [self.view insertSubview:_webview belowSubview:_progressView];
    // 自定义 TVSWebView 内部的 UIScrollView
    _webview.scrollView.bounces = YES;
    _webview.scrollView.showsVerticalScrollIndicator = YES;
    
    // 加载网页或 URL
    if (_url) {
        [_webview loadUrl:_url];
    } else {
        [_webview loadPage:_pageType];
    }
}

-(UIButton*)newButtonX:(CGFloat)x title:title sel:(SEL)sel {
    UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(x, 0, 30, 40)];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:btn.tintColor forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    btn.enabled = NO;
    [_vNav addSubview:btn];
    return btn;
}

-(void)refreshButtons {
    _btnReload.enabled = YES;
    _btnBack.enabled = [_webview canGoBack];
    _btnBack.enabled = YES;//[_webview canGoBack];
    _btnForward.enabled = [_webview canGoForward];
}

// 回退网页
- (void)onClickBtnBack:(id)sender {
    [_webview goBack];
}

// 刷新网页
- (void)onClickBtnReload:(id)sender {
    [_webview reload];
}

// 停止加载网页
- (void)onClickBtnStop:(id)sender {
    [_webview stopLoading];
}

// 前进网页
- (void)onClickBtnForward:(id)sender {
    [_webview goForward];
}

#pragma mark TVSWebUIDelegate 网页 UI 回调

// 网页加载开始
-(void)TVSWebLoadStart {
    _progressView.hidden = NO;
    _progressView.progress = 0;
    _btnStop.enabled = YES;
    [self refreshButtons];
}

// 网页加载进度更新
-(void)TVSWebLoadProgress:(double)progress {
    _progressView.progress = progress;
    [self refreshButtons];
}

// 网页加载完成
-(void)TVSWebLoadFinish {
    _progressView.hidden = YES;
    _progressView.progress = 0;
    _btnStop.enabled = NO;
    [self refreshButtons];
}

// 网页加载错误
-(void)TVSWebLoadError:(NSError *)error {
    _progressView.hidden = YES;
    _progressView.progress = 0;
    _btnStop.enabled = NO;
    [self refreshButtons];
    NSLog(@"TVSWeb load error:%@", error.localizedDescription);
}

// 网页拉取到标题
-(void)TVSWebGotTitle:(NSString *)title {
    self.title = title;
}

#pragma mark TVSWebBusinessDelegate 网页业务回调

// 网页透传数据
-(void)TVSWebProxyData:(NSDictionary *)data {
    NSLog(@"TVSWeb proxyData:%@", data);
}

// 网页请求关闭
-(void)TVSWebRequestExit {
    [self.navigationController popViewControllerAnimated:YES];
}

// 是否允许加载指定网页链接
-(BOOL)TVSWebShouldLoadUrl:(NSString *)url {
    return YES;
}

@end
