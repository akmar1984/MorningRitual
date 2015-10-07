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

@interface MainMenuViewController ()
@property (nonatomic)VBFPopFlatButton *flatRoundedButton;
@end
@implementation MainMenuViewController
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

    [self setAnimatedButton];
    
}
-(void)setAnimatedButton{
    CGPoint middleScreen = CGPointMake(roundf(self.view.bounds.size.width - 50)/2.0, roundf(self.view.bounds.size.height -50)/2.0);
    self.flatRoundedButton = [[VBFPopFlatButton alloc]initWithFrame:CGRectMake(middleScreen.x, middleScreen.y, 50, 50) buttonType:buttonAddType buttonStyle:buttonRoundedStyle animateToInitialState:YES];
    self.flatRoundedButton.backgroundColor = [UIColor whiteColor];
    self.flatRoundedButton.tintColor = [UIColor blueColor];
    [self.flatRoundedButton addTarget:self
                            action:@selector(tappedButton:)
                     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.flatRoundedButton];
    
    
    
}

-(void)delaySegue{
    [self performSegueWithIdentifier:@"MPController" sender:nil];
    
}
-(IBAction)tappedButton:(id)sender{
    
    [self.flatRoundedButton animateToType:buttonOkType];
    

    [self performSelector:@selector(delaySegue) withObject:nil afterDelay:0.6];
   

}
@end
