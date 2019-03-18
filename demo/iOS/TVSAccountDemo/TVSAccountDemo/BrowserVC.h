//
//  BrowserVC.h
//  TVSAccountDemo
//
//  Created by Rinc Liu on 8/3/2019.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "BaseVC.h"
#import <TVSWeb/TVSWeb.h>

NS_ASSUME_NONNULL_BEGIN

@interface BrowserVC : BaseVC

@property (nonatomic,assign) TVSWebPageType pageType;
@property (nonatomic,strong) NSString *pid, *dsn, *url;

@end

NS_ASSUME_NONNULL_END
