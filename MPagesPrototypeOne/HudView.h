//
//  HudView.h
//  MPagesPrototypeOne
//
//  Created by Marek Tomaszewski on 21/09/2015.
//  Copyright (c) 2015 CodeImagination. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HudView : UIView
@property (nonatomic, copy)NSString *text;
+(instancetype)hudInView:(UIView *)view animated:(BOOL)animated;

@end
