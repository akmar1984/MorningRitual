//
//  HudView.m
//  MPagesPrototypeOne
//
//  Created by Marek Tomaszewski on 21/09/2015.
//  Copyright (c) 2015 CodeImagination. All rights reserved.
//

#import "HudView.h"
#import "FontAwesomeKit.h"

@implementation HudView



+(instancetype)hudInView:(UIView *)view animated:(BOOL)animated{
    
    HudView *hudView = [[HudView alloc]initWithFrame:view.bounds];
    hudView.opaque = NO;
    hudView.alpha = 0.5;
    [view addSubview:hudView];
    view.userInteractionEnabled = NO;
    hudView.text = @"Well Done!";
    
    [hudView showAnimated:animated];
    return hudView;
}
-(void)showAnimated:(BOOL)animated{
    
    self.alpha = 0.0f;
    self.transform = CGAffineTransformMakeScale(1.3f, 1.3f);
    
    [UIView animateWithDuration:2.0f animations:^{
        
        self.alpha = 1.0f;
        self.transform = CGAffineTransformIdentity;
    }];
}
- (void)drawRect:(CGRect)rect {
    const CGFloat boxWidth = 120.0f; //default 96.0f
    const CGFloat boxHeight = 120.0f; //default 96.0f


    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:
                                CGRectMake(roundf(self.bounds.size.width - boxWidth)/2.0,
                                           roundf(self.bounds.size.height - boxHeight)/2.0 ,
                                           boxWidth,
                                           boxHeight)
                                        cornerRadius:10.0f];
    
    [[UIColor colorWithRed:28.0f/255.0f green:69.0f/255.0f blue:135.0f/255.0f alpha:0.3]setFill];
    [roundedRect fill];
    

    
    FAKFontAwesome *tickIcon =[ FAKFontAwesome tagIconWithSize:20];
    [tickIcon addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:12.0f/255.0f green:52.0f/255.0f blue:61.0f/255.0f alpha:1.0]];
    UIImage *image = [tickIcon imageWithSize:CGSizeMake(20, 20)];
    CGPoint centerPoint =CGPointMake(self.center.x - roundf(image.size.width /2.0f), self.center.y - roundf(image.size.height/ 2.0)- boxHeight/3);
    [image drawAtPoint:centerPoint];
    
    NSDictionary *attributesDictionary = @{
                                           NSForegroundColorAttributeName : [UIColor colorWithRed:12.0f/255.0f green:52.0f/255.0f blue:61.0f/255.0f alpha:1.0],
                                          
                                           NSFontAttributeName : [UIFont fontWithName:@"Futura-Medium" size:22.0f]
                                           };
    CGSize textSize = [self.text sizeWithAttributes:attributesDictionary];
    CGPoint drawPoint = CGPointMake(self.center.x - roundf(textSize.width / 2.0f), self.center.y - roundf(textSize.height / 2.0f));
    
    
    [self.text drawAtPoint:drawPoint withAttributes:attributesDictionary];
    
}


@end
