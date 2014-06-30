//
//  FirstPlayerViewController.h
//  FirstPlayer
//
//  Created by liujs on 14-6-25.
//  Copyright (c) 2014年 liujs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface FirstPlayerViewController : UIViewController{
//    UIButton *playBtn;
//    UIButton *stopBtn;
    MPMoviePlayerController *moviePlayer;
    
}

//@property (retain,nonatomic) IBOutlet UIButton *playBtn;
//@property (retain,nonatomic) IBOutlet UIButton *stopBtn;

@property (retain, nonatomic) MPMoviePlayerController *moviePlayer;
@property (weak, nonatomic) IBOutlet UILabel *label;



- (IBAction)playVideo:(id)sender;
- (IBAction)stopVideo:(id)sender;





@end
