//
//  WebVC.m
//  TVSAccountDemo
//
//  Created by Rinc Liu on 29/1/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "WebVC.h"
#import "BrowserVC.h"

@interface WebVC ()<UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic,strong) NSArray* pageTypeArray;
@property(nonatomic,assign) TVSWebPageType pageType;

@end

@implementation WebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pageTypeArray = @[@"智能家居", @"QQ 音乐", @"账号授权", @"个人中心", @"会员领取", @"会员充值", @"手机号地址", @"用户反馈"];
    _picker.dataSource = self;
    _picker.delegate = self;
    _pageType = TVSWebPageTypeMember;
    [_picker selectRow:_pageType inComponent:0 animated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//打开指定类型的 H5 页面
- (IBAction)onClickBtnOpenPage:(id)sender {
    BrowserVC* bv = [self browserVc];
    bv.pageType = _pageType;
    [self.navigationController pushViewController:bv animated:YES];
}

// 打开自定义 URL
- (IBAction)onClickBtnOpenUrl:(id)sender {
    if (NotEmpty(_tfUrl.text)) {
        BrowserVC* bv = [self browserVc];
        bv.url = _tfUrl.text;
        [self.navigationController pushViewController:bv animated:YES];
    }
}

-(BrowserVC*)browserVc {
    BrowserVC* bv = [BrowserVC new];
    bv.pid = _tfPid.text;
    bv.dsn = _tfDsn.text;
    return bv;
}

#pragma mark UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _pageTypeArray ? _pageTypeArray.count : 0;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _pageTypeArray[row];
}

#pragma mark UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _pageType = row;
}

@end
