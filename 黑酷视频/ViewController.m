//
//  ViewController.m
//  黑酷视频
//
//  Created by piglikeyoung on 15/3/24.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+MJ.h"
#import "JHVideo.h"
#import "UIImageView+WebCache.h"
#import "JHVideoCell.h"
#import "JHMoviePlayerViewController.h"

@interface ViewController ()

@property (strong , nonatomic) NSArray *videos;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    MBProgressHUD *showView = [MBProgressHUD showMessage:@"正在加载视频信息"];
    
    
    
    //    NSXMLParser  XML 解析
    // MediaPlayer\AVFoundation
    
    // 访问服务器数据
    NSString *urlStr = @"http://192.168.1.200:8080/MJServer/video";
    
    // 发送请求
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.timeoutInterval = 5;
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // 隐藏
//        [MBProgressHUD hideHUD];
        [showView setHidden:YES];
        
        if (data) {
            // 解析数据
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSArray *array = dict[@"videos"];
            
            NSMutableArray *videos = [NSMutableArray array];
            for (NSDictionary *videoDict in array) {
                JHVideo *video = [JHVideo videoWithDict:videoDict];
                [videos addObject:video];
            }
            self.videos = videos;
            
            // 刷新表格
            [self.tableView reloadData];
        }else{
            [MBProgressHUD showError:@"网络繁忙!!!"];
            // 刷新表格
            [self.tableView reloadData];
        }
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.videos.count;
    return 16;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    JHVideoCell *cell = [JHVideoCell cellWithTableView:tableView];
    
    cell.video = self.videos[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHVideo *video = self.videos[indexPath.row];
    
    // 播放视频
    NSString *videoUrl = [NSString stringWithFormat:@"http://192.168.1.200:8080/MJServer/%@", video.url];
    JHMoviePlayerViewController *playerVc = [[JHMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:videoUrl]];
    [self presentMoviePlayerViewControllerAnimated:playerVc];
}

@end
