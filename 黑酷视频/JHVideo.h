//
//  JHVideo.h
//  黑酷视频
//
//  Created by piglikeyoung on 15/3/24.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHVideo : NSObject

/**
 *  视频ID
 */
@property (assign, nonatomic) int ID;
/**
 *  视频名称
 */
@property (copy, nonatomic) NSString *name;
/**
 *  视频长度
 */
@property (assign, nonatomic) int length;
/**
 *  视频图片
 */
@property (copy, nonatomic) NSString *image;
/**
 *  视频链接
 */
@property (copy, nonatomic) NSString *url;

+ (instancetype)videoWithDict:(NSDictionary *)dict;


@end
