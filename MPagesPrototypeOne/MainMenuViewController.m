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
#import "TAOverlay.h"


@interface MainMenuViewController ()
@property (nonatomic)BFPaperButton *flatRoundedButton;
@property (nonatomic)BFPaperButton *infoRoundedButton;

@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;

@end
@implementation MainMenuViewController{
    
    AVPlayerLayer *_playerLayer;
    UIView *_playerView;
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
   
    
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

}
-(void)setTheVideo{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Snoler" ofType:@"mov"];
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loopVideo) name:AVPlayerItemDidPlayToEndTimeNotification object:[_playerLayer.player currentItem]];

    
    
}

-(void)viewDidLoad{

    self.titleImageView.layer.zPosition = 10;
    [self setTheVideo];
    
    [self setAnimatedButton];
    
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
    
    
    
    self.infoRoundedButton = [[BFPaperButton alloc]initWithFrame:CGRectMake(middleScreen.x, middleScreen.y+100, 50, 50) raised:NO];
    
    self.infoRoundedButton.backgroundColor = [UIColor paperColorBlue800];
    self.infoRoundedButton.alpha = 0.6;
    self.infoRoundedButton.cornerRadius = self.flatRoundedButton.frame.size.width / 2.0;
    self.infoRoundedButton.tapCircleColor = [UIColor yellowColor];
    self.infoRoundedButton.rippleFromTapLocation = NO;
    
    FAKFontAwesome *infoIcon = [FAKFontAwesome infoIconWithSize:20];
    [infoIcon addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
    [self.infoRoundedButton setBackgroundImage:[infoIcon imageWithSize:CGSizeMake(30,30)] forState:UIControlStateNormal];
    
    
    
    [self.infoRoundedButton addTarget:self
                               action:@selector(infoOverlay:)
                     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.infoRoundedButton];
    
    
    
}
-(IBAction)infoOverlay:(id)sender{
    
    [TAOverlay showOverlayWithLabel:@"Morning Ritual is an app inspired by the 'Morning Pages' a concept from 'The Artist 's Way' by Julia Cameron, which promotes the idea of writing down three pages of your thoughts each morning to clear your mind."
                            Options:TAOverlayOptionOverlayTypeInfo |
                            TAOverlayOptionOverlaySizeRoundedRect |
                            TAOverlayOptionOverlayDismissTap];
       
}
-(void)delaySegue{

    [self performSegueWithIdentifier:@"MPController" sender:nil];
    
}
-(IBAction)tappedButton:(id)sender{
    
   [self performSelector:@selector(delaySegue) withObject:nil afterDelay:0.2];
   

}
@end
