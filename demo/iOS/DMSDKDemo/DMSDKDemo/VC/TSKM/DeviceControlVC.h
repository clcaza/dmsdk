//
//  DeviceControlVC.h
//  DMSDKDemo
//
//  Created by Rinc Liu on 8/4/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface DeviceControlVC : BaseVC

@property (strong, nonatomic) IBOutlet UITextView *tvPayload;
@property (strong, nonatomic) IBOutlet UITextView *tvResult;
@property (strong, nonatomic) IBOutlet UITextField *tfNamespace;
@property (strong, nonatomic) IBOutlet UITextField *tfName;

@property(nonatomic,strong) TVSDeviceInfo* deviceInfo;

@end

NS_ASSUME_NONNULL_END
