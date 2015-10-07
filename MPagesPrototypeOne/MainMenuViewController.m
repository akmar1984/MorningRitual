//
//  MainMenuViewController.m
//  MPagesPrototypeOne
//
//  Created by Marek Tomaszewski on 02/08/2015.
//  Copyright (c) 2015 CodeImagination. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MPInputViewController.h"
@interface MainMenuViewController ()

@end
@implementation MainMenuViewController
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

    
}

-(void)setupButton{
    
    UIButton *buttonFont = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonFont.frame = CGRectMake(100, 100, 50, 50);
    
    [buttonFont setTitle:@"Image" forState:UIControlStateNormal];
    buttonFont.backgroundColor = [UIColor whiteColor];
    buttonFont.alpha = 0.1;
    [buttonFont addTarget:self action:@selector(tappedButton:) forControlEvents:UIControlEventTouchUpInside];
    
    buttonFont.layer.cornerRadius = buttonFont.bounds.size.width/2;
    //buttonFont.layer.borderWidth = 2.0f;
    buttonFont.clipsToBounds = YES;
    [self.view addSubview:buttonFont];
}

-(IBAction)tappedButton:(id)sender{
    
        [self performSegueWithIdentifier:@"MPController" sender:sender];

}
@end
