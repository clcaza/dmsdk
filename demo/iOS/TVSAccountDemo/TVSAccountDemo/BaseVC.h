//
//  BaseVC.h
//  TVSAccountDemo
//
//  Created by Rinc Liu on 29/1/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define NotEmpty(s) (s&&s.length>0)

@interface BaseVC : UIViewController

-(void)checkLogin:(void(^)(void))block;

-(void)showText:(NSString*)text view:(UITextView*)tv;

@end

NS_ASSUME_NONNULL_END
