//
//  JHVideoCell.h
//  黑酷视频
//
//  Created by piglikeyoung on 15/3/24.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHVideo;

@interface JHVideoCell : UITableViewCell

@property (nonatomic, strong) JHVideo *video;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
