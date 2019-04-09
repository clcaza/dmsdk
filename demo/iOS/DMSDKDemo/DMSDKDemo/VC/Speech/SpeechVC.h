//
//  SpeechVC.h
//  DMSDKDemo
//
//  Created by Rinc Liu on 5/3/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface SpeechVC : BaseVC

@property (strong, nonatomic) IBOutlet UITextField *tfSpeed;
@property (strong, nonatomic) IBOutlet UITextField *tfVolume;
@property (strong, nonatomic) IBOutlet UITextField *tfSpeechId;
@property (strong, nonatomic) IBOutlet UITextField *tfPid;
@property (strong, nonatomic) IBOutlet UITextField *tfDsn;
@property (strong, nonatomic) IBOutlet UITextView *tvResult;

@end

NS_ASSUME_NONNULL_END
