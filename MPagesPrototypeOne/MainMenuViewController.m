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

@interface MainMenuViewController ()
@property (nonatomic)BFPaperButton *flatRoundedButton;

@end
@implementation MainMenuViewController
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

    [self setAnimatedButton];
    
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
