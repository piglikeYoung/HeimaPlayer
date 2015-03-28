//
//  JHVideoCell.m
//  黑酷视频
//
//  Created by piglikeyoung on 15/3/24.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHVideoCell.h"
#import "JHVideo.h"
#import "UIImageView+WebCache.h"
#import "UIView+Extension.h"

@interface JHVideoCell()
@property (nonatomic, weak) UIView *divider;
@end

@implementation JHVideoCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"video";
    JHVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[JHVideoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *divider = [[UIView alloc] init];
        divider.backgroundColor = [UIColor lightGrayColor];
        divider.alpha = 0.2;
        [self.contentView addSubview:divider];
        self.divider = divider;
    }
    
    return self;
}

- (void)setVideo:(JHVideo *)video
{
    _video = video;
    
    self.textLabel.text = video.name;
    self.detailTextLabel.text = [NSString stringWithFormat:@"时长:%d分钟", video.length];
    
    // video.image == resources/images/minion_01.png
    NSString *imageUrl = [NSString stringWithFormat:@"http://192.168.1.200:8080/MJServer/%@", video.image];
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调整子控件的frame
    CGFloat imageX = 10;
    CGFloat imageY = 10;
    CGFloat imageH = self.height - 2 * imageY;
    CGFloat imageW = imageH * 200 / 112;// 按比例缩小
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    self.textLabel.x = CGRectGetMaxX(self.imageView.frame);
    
    self.detailTextLabel.x = self.textLabel.x;
    
    CGFloat dividerH = 1;
    CGFloat dividerY = self.height - dividerH;
    CGFloat dividerW = self.width;
    self.divider.frame = CGRectMake(0, dividerY, dividerW, dividerH);
}


@end
