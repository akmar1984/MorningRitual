//
//  MPInputViewController.m
//  MPagesPrototypeOne
//
//  Created by Marek Tomaszewski on 29/07/2015.
//  Copyright (c) 2015 CodeImagination. All rights reserved.
//

#import "MPInputViewController.h"
#import "FontAwesomeKit.h"
#import "HudView.h"
#import "TAOverlay.h"

static const CGFloat buttonOffset = 60;

@interface MPInputViewController () <UITextViewDelegate>
@property (nonatomic) UITextView *textView;
@property (nonatomic) NSInteger counter;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *exitButton;

@end

@implementation MPInputViewController{
    
    
    UIView *_accessoryView;
    BOOL _fontBold;
    int _fontCounter;
    NSString *_fontNameStringBold;
    NSString *_fontNameStringLight;
    UIImageView *_pageImage01;
    UIImageView *_pageImage02;
    UIImageView *_pageImage03;

    
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        // Place code here to perform animations during the rotation.
        // You can pass nil or leave this block empty if not necessary.
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        // Code here will execute after the rotation has finished.
        // Equivalent to placing it in the deprecated method -[didRotateFromInterfaceOrientation:]
        
        self.textView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
       
    }];
    

}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTextView];
    
   
    
}
-(IBAction)closeScreen:(id)sender{

    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)viewDidLoad{
    
    [super viewDidLoad];
   
    
 
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text {
  
    if ([text isEqualToString:@" "]) {
        self.counter++;
    }
    if ([text isEqualToString:@""]) {
        self.counter--;
        
    }
    if (self.counter >= 2) {
        _pageImage01.hidden = NO;
    }else{
        _pageImage01.hidden = YES;
    }
    if (self.counter >= 4) {
        _pageImage02.hidden = NO;
    }else{
        _pageImage02.hidden = YES;
    }
    if (self.counter >= 6) {
        _pageImage03.hidden = NO;
        [TAOverlay showOverlayWithLabel:@"Well Done" Options:TAOverlayOptionAutoHide  | TAOverlayOptionOverlayTypeSuccess];
//        [HudView hudInView:self.navigationController.view animated:YES];
        [self performSelector:@selector(closeScreen:) withObject:self afterDelay:2]; //default 1.6
    }else{
        _pageImage03.hidden = YES;
    }
    return YES;
}
-(void)setInputButtonViews{
    static const CGFloat buttonWidth = 30;
    static const CGFloat buttonHeight = 30;

    UIButton *buttonFont = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonFont.frame = CGRectMake(0, 0, buttonWidth, buttonHeight);
    
   
     
     FAKFontAwesome *fontIcon = [FAKFontAwesome fontIconWithSize:20];
    [fontIcon addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:188.0f/255.0f green:77.0f/255.0f blue:77.0f/255.0f alpha:1.0]];
     [buttonFont setBackgroundImage:[fontIcon imageWithSize:CGSizeMake(30,30)] forState:UIControlStateNormal];
    buttonFont.backgroundColor = [UIColor clearColor];
    buttonFont.alpha = 0.9;
    [buttonFont addTarget:self action:@selector(changeFont) forControlEvents:UIControlEventTouchUpInside];
    buttonFont.clipsToBounds = YES;
    
    UIButton *buttonFont2 = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonFont2.frame = CGRectMake(buttonOffset, 0, buttonWidth, buttonHeight);
   
    FAKFontAwesome *boldIcon = [FAKFontAwesome boldIconWithSize:20];
    [boldIcon addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:188.0f/255.0f green:77.0f/255.0f blue:77.0f/255.0f alpha:1.0]];
    [buttonFont2 setBackgroundImage:[boldIcon imageWithSize:CGSizeMake(30,30)] forState:UIControlStateNormal];
   
    buttonFont2.alpha = 0.9;
    [buttonFont2 addTarget:self action:@selector(fontBold) forControlEvents:UIControlEventTouchUpInside];
    buttonFont2.clipsToBounds = YES;
    
    
   
    
    FAKFontAwesome *starIcon = [FAKFontAwesome fileTextOIconWithSize:20];

    [starIcon addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:188.0f/255.0f green:77.0f/255.0f blue:77.0f/255.0f alpha:1.0]]; //jasny bordo
    UIImage *pageIndicator = [starIcon imageWithSize:CGSizeMake(25, 25)];
                              
    _pageImage01 =[[ UIImageView alloc]initWithImage:pageIndicator];
    _pageImage01.frame = CGRectMake(buttonOffset * 3.75, 0, 30, 30); //4th button
    _pageImage01.hidden = YES;
    _pageImage02 = [[UIImageView alloc]initWithImage:pageIndicator];
    _pageImage02.frame = CGRectMake(buttonOffset * 4.25, 0, 30, 30); //5th button
    _pageImage02.hidden = YES;
    _pageImage03 = [[UIImageView alloc]initWithImage:pageIndicator];
    _pageImage03.frame = CGRectMake(buttonOffset * 4.75, 0, 30, 30); //5th button
    _pageImage03.hidden = YES;

   
    
    
    [_accessoryView addSubview:buttonFont];
    [_accessoryView addSubview:buttonFont2];
    [_accessoryView addSubview:_pageImage01];
    [_accessoryView addSubview:_pageImage02];
    [_accessoryView addSubview:_pageImage03];


    
}
-(void)changeFont{
 
    _fontCounter++;
    
    switch (_fontCounter) {
        case 0:
            
                _fontNameStringLight = @"AppleSDGothicNeo-Regular";
                _fontNameStringBold = @"AppleSDGothicNeo-Bold";
            break;
        case 1:
                _fontNameStringLight = @"AlNile";
                _fontNameStringBold = @"AlNile-Bold";

            break;
        case 2:
                _fontNameStringLight = @"Avenir-Light";
                _fontNameStringBold = @"Avenir-Black";
            _fontCounter = -1;
            break;
        default:
            
            break;
    }

    if (!_fontBold) {
    self.textView.font = [UIFont fontWithName:_fontNameStringLight size:20];
    }else{
        self.textView.font = [UIFont fontWithName:_fontNameStringBold size:20];
    }
    

}
-(void)fontBold{
    
    if (!_fontBold) {
        _fontBold = YES;
        
        switch (_fontCounter) {
            case 0:
                
                _fontNameStringLight = @"AppleSDGothicNeo-Regular";
                _fontNameStringBold = @"AppleSDGothicNeo-Bold";
                break;
            case 1:
                _fontNameStringLight = @"AlNile";
                _fontNameStringBold = @"AlNile-Bold";
                
                break;
            case 2:
                _fontNameStringLight = @"Avenir-Light";
                _fontNameStringBold = @"Avenir-Black";
                
            default:
                break;
        }
        
        self.textView.font = [UIFont fontWithName:_fontNameStringBold size:20];

    }else{
        _fontBold = NO;
        self.textView.font = [UIFont fontWithName:_fontNameStringLight size:20];

    }
    
}
-(void)setInputAccessoryView{
    
    _accessoryView = [[UIView alloc]initWithFrame:CGRectMake(20.0f, 0.0f, 310.0f, 30.0)];
    _accessoryView.backgroundColor = [UIColor clearColor];
    _accessoryView.alpha = 1.0;
    [self setInputButtonViews];
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
    [self setInputAccessoryView];
    [self.textView setInputAccessoryView:_accessoryView];
    return YES;
}

-(void)resetPageIndicator{
    
    self.counter = 0;
    _pageImage01.hidden = YES;
    _pageImage02.hidden = YES;
    _pageImage03.hidden = YES;
}
- (IBAction)refreshButton:(id)sender {
    
    self.textView.text = @"";
    [self resetPageIndicator];
}

-(void)setupTextView{
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(0 , 0, self.view.bounds.size.width , self.view.bounds.size.height)];
    self.textView.alpha = 1.0;
    self.textView.backgroundColor = [UIColor whiteColor];
    self.textView.font = [UIFont fontWithName:@"Futura-Medium" size:20];
    self.textView.textColor = [UIColor colorWithRed:56.0f/255.0f green:120.0f/255.0f blue:22.0f/255.0f alpha:1.0];
    //dark blue [UIColor colorWithRed:12.0f/255.0f green:52.0f/255.0f blue:61.0f/255.0f alpha:1.0];
     self.textView.delegate = self;
    self.textView.autocorrectionType = UITextAutocorrectionTypeNo;
    
    [self.textView setContentOffset:CGPointMake(0, 0)];
    [self.view addSubview:self.textView];
    [self.textView becomeFirstResponder];
    
    

}

@end
