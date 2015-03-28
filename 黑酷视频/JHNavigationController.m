//
//  JHNavigationController.m
//  黑酷视频
//
//  Created by piglikeyoung on 15/3/24.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHNavigationController.h"

@interface JHNavigationController ()

@end

@implementation JHNavigationController


#pragma mark - 实现这个方法来控制屏幕方向
/**
 *  控制当前控制器支持哪些方向
 *  返回值是UIInterfaceOrientationMask*
 */
- (NSUInteger)supportedInterfaceOrientations
{
    /**
     *  UIInterfaceOrientationMaskPortrait : 竖屏(正常)
     *  UIInterfaceOrientationMaskPortraitUpsideDown : 竖屏(上下颠倒)
     *  UIInterfaceOrientationMaskLandscapeLeft : 横屏向左
     *  UIInterfaceOrientationMaskLandscapeRight : 横屏向右
     *  UIInterfaceOrientationMaskLandscape : 横屏(横屏向左\横屏向右)
     *  UIInterfaceOrientationMaskAll : 全部方向(包括上面的所有情况)
     */
    return UIInterfaceOrientationMaskPortrait;
}

@end
