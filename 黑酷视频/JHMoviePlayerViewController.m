//
//  JHMoviePlayerViewController.m
//  黑酷视频
//
//  Created by piglikeyoung on 15/3/24.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHMoviePlayerViewController.h"

@implementation JHMoviePlayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 移除程序进入后台的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
}

#pragma mark - 实现这个方法来控制屏幕方向
/**
 *  控制当前控制器支持哪些方向
 *  返回值是UIInterfaceOrientationMask*
 */
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}


@end
