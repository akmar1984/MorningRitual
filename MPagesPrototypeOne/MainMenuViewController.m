//
//  MainMenuViewController.m
//  MPagesPrototypeOne
//
//  Created by Marek Tomaszewski on 02/08/2015.
//  Copyright (c) 2015 CodeImagination. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MPInputViewController.h"
#import "VBFPopFlatButton.h"
#import "BFPaperButton.h"
#import "UIColor+BFPaperColors.h"
#import "FontAwesomeKit.h"
#import <AVFoundation/AVFoundation.h>
@import MediaPlayer;
@interface MainMenuViewController ()
@property (nonatomic)BFPaperButton *flatRoundedButton;
@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;
@property (nonatomic, strong)MPMoviePlayerController *moviePlayer;
@end
@implementation MainMenuViewController{
    
    AVPlayerLayer *_playerLayer;
    UIView *_playerView;
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.titleImageView.layer.zPosition = 10;
    [self setTheVideo];
    
    [self setAnimatedButton];
    
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

}
-(void)setTheVideo{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"flower2" ofType:@"m4v"]; // flower2 720x576
    NSURL *url = [NSURL fileURLWithPath:path];
    
    _playerLayer =[AVPlayerLayer playerLayerWithPlayer:[[AVPlayer alloc]initWithURL:url]];
    self.view.backgroundColor = [UIColor clearColor];
    
    _playerView = [[UIView alloc]initWithFrame:self.view.bounds];
    _playerView.backgroundColor = [UIColor clearColor];
    
    _playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view insertSubview:_playerView atIndex:1];
    [_playerView.layer addSublayer:_playerLayer];
    _playerLayer.player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
   
    [_playerLayer.player play];
    
    _playerLayer.frame = _playerView.layer.bounds;
    
    
}

-(void)viewDidLoad{

[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loopVideo) name:AVPlayerItemDidPlayToEndTimeNotification object:_playerLayer.player];
    
    
}

- (void)loopVideo {
    [_playerLayer.player seekToTime:kCMTimeZero];
    [_playerLayer.player play];

}
-(void)setAnimatedButton{
    CGPoint middleScreen = CGPointMake(roundf(self.view.bounds.size.width - 50)/2.0, roundf(self.view.bounds.size.height -50)/2.0);
    self.flatRoundedButton = [[BFPaperButton alloc]initWithFrame:CGRectMake(middleScreen.x, middleScreen.y, 50, 50) raised:NO];
    
    self.flatRoundedButton.backgroundColor = [UIColor paperColorBlue800];
    self.flatRoundedButton.alpha = 0.6;
    self.flatRoundedButton.cornerRadius = self.flatRoundedButton.frame.size.width / 2.0;
    self.flatRoundedButton.tapCircleColor = [UIColor yellowColor];
    self.flatRoundedButton.rippleFromTapLocation = NO;
    
    FAKFontAwesome *pencilIcon = [FAKFontAwesome pencilIconWithSize:20];
    [pencilIcon addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
    [self.flatRoundedButton setBackgroundImage:[pencilIcon imageWithSize:CGSizeMake(30,30)] forState:UIControlStateNormal];


    
    [self.flatRoundedButton addTarget:self
                            action:@selector(tappedButton:)
                     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.flatRoundedButton];
    
    
    
}

-(void)delaySegue{
    [self performSegueWithIdentifier:@"MPController" sender:nil];
    
}
-(IBAction)tappedButton:(id)sender{
    
   [self performSelector:@selector(delaySegue) withObject:nil afterDelay:0.3];
   

}
@end
