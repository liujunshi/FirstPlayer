//
//  FirstPlayerViewController.m
//  FirstPlayer
//
//  Created by liujs on 14-6-25.
//  Copyright (c) 2014年 liujs. All rights reserved.
//

#import "FirstPlayerViewController.h"

@interface FirstPlayerViewController ()

@end

@implementation FirstPlayerViewController


//@synthesize playBtn;
@synthesize moviePlayer;
@synthesize label=_label;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /**
     http://g3.letv.com/api/geturl?fmt=0&b=588800&mmsid=21244111&splatid=10301&platid=103&storepath=67/43/108/letv-uts/14/ver_00_16-23530480-avc-1157156-aac-64011-169403-26070863-980222a1d891ca94465429da550c4b2a-1403678954741.mp4
    */
    
    moviePlayer =[[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"http://g3.letv.com/api/geturl?fmt=0&b=588800&mmsid=21244111&splatid=10301&platid=103&storepath=67/43/108/letv-uts/14/ver_00_16-23530480-avc-1157156-aac-64011-169403-26070863-980222a1d891ca94465429da550c4b2a-1403678954741.mp4"]];
    
    moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
    
    /**
     MPMovieControlStyleEmbedded         显示播放/暂停、音量和时间控制
     MPMovieControlStyleFullscreen       只显示音量控制
     MPMovieControlStyleNone             没有控制器
     */
    
    [moviePlayer.view setFrame:CGRectMake(0, 0, 320, 380)];
//    [moviePlayer prepareToPlay];
    
//    [self.view addSubview:moviePlayer.view];//设置写在添加之后   // 这里是addSubView
    
//    moviePlayer.shouldAutoplay=NO;
//    
//    [moviePlayer setControlStyle:MPMovieControlStyleDefault];
//    
//    [moviePlayer setFullscreen:NO];
//    
//    [moviePlayer.view setFrame:self.view.bounds];
    
    NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
    
    [ notificationCenter addObserver:self selector:@selector(playVideoFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer ];
    /**
     
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playVideo:(id)sender {
    NSLog(@"Into playvideo.");
    [self.view insertSubview:[self.moviePlayer view] atIndex:10];
    [self.moviePlayer play];
    self.label.text = @"you play";
    
}

- (IBAction)stopVideo:(id)sender {
    NSLog(@"into stopVideo...");
    [self.moviePlayer stop];
     self.label.text = @"you stop";
}

//Notification
-(void)playVideoFinished:(NSNotification*)notification{
	 NSLog(@"into notify ...");
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:player];
    [player stop];
    [self.navigationController popViewControllerAnimated:YES];
    self.label.text = @"moive play over ,good bye";
     NSLog(@"into notify ...over");
}


@end
