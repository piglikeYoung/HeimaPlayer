//
//  JHVideo.m
//  黑酷视频
//
//  Created by piglikeyoung on 15/3/24.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHVideo.h"

@implementation JHVideo

+(instancetype)videoWithDict:(NSDictionary *)dict
{
    /**
     dict = { "id":1,
     "url":"resources/videos/minion_01.mp4",
     "name":"小黄人 第01部",
     "length":10,
     "image":"resources/images/minion_01.png" }
     */
    JHVideo *video = [[self alloc] init];
    video.name = dict[@"name"];
    video.image = dict[@"image"];
    video.url = dict[@"url"];
    video.length = [dict[@"length"] intValue];
    video.ID = [dict[@"id"] intValue];
    return video;
    //    [video setValuesForKeysWithDictionary:dict]; // KVC方法使用前提: 字典中的所有key 都能在 模型属性 中找到}
}
@end
