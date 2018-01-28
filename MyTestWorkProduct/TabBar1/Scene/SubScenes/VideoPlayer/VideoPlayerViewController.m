//
//  VideoPlayerViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/25.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "VideoPlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@interface VideoPlayerViewController ()

@end

@implementation VideoPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MPMoviePlayerViewController *movie =[[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString:@"http://7xqkjm.com1.z0.glb.clouddn.com/ZF_922310.mp4"]];
    
    
    [movie.moviePlayer prepareToPlay];
    [self presentViewController:movie animated:YES completion:^{
        [movie.moviePlayer play];
    }];
    [movie.moviePlayer setControlStyle:MPMovieControlStyleFullscreen];
    
    
    
    [movie.view setBackgroundColor:[UIColor clearColor]];
    
    
    
    [movie.view setFrame:self.view.bounds];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
     
     
     
                                           selector:@selector(movieFinishedCallback:)
     
     
     
                                               name:MPMoviePlayerPlaybackDidFinishNotification
     
     
     
                                             object:movie.moviePlayer];
    
 
    
    
}

-(void)movieFinishedCallback:(NSNotification*)notify{
    
    
    
    // 视频播放完或者在presentMoviePlayerViewControllerAnimated下的Done按钮被点击响应的通知。
    
    
    
    MPMoviePlayerController* theMovie = [notify object];
    
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self
     
     
     
                                                  name:MPMoviePlayerPlaybackDidFinishNotification
     
     
     
                                                object:theMovie];
    
    
    
    [self dismissMoviePlayerViewControllerAnimated];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
