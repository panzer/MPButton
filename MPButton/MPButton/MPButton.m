//
//  MPButton.m
//  MPButton
//
//  Created by Matt Panzer on 6/23/13.
//  Copyright (c) 2013 Lenny Khazan. All rights reserved.
//

#import "MPButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation MPButton

@synthesize cornerRatio = _cornerRatio;
@synthesize background = _background;
@synthesize currentColor = _currentColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame color:(UIColor *)color {
    
    self = [self initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = self.frame.size.height/2;
        self.layer.borderWidth = 1;
        self.layer.borderColor = color.CGColor;
        self.currentColor = color;
        self.layer.backgroundColor = [UIColor clearColor].CGColor;
        self.clipsToBounds = YES;
        self.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:15];
        self.background = NO;
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame color:(UIColor *)color text:(NSString *)text {
    
    self = [self initWithFrame:frame color:color];
    if (self) {
        [self setTitle:text forState:UIControlStateNormal];
        [self setTitleColor:color forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void) setCornerRatioWithDivisor:(int)divisor {
    
    self.layer.cornerRadius = self.frame.size.height/divisor;
    
}

- (void) setBackgroundStateWithState:(BOOL)state {
    
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    [self.currentColor getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    if (state == TRUE) {
        self.layer.backgroundColor = [self.currentColor colorWithAlphaComponent:.8].CGColor;
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.background = YES;
    }else{
        self.layer.backgroundColor = [UIColor clearColor].CGColor;
        [self setTitleColor:self.currentColor forState:UIControlStateNormal];
        self.background = NO;
    }
}

- (void) setColor:(UIColor *)color {
    
    self.currentColor = color;
    self.layer.borderColor = color.CGColor;
    [self setBackgroundStateWithState:self.background];
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
@end
