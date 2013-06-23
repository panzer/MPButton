//
//  MPButton.h
//  MPButton
//
//  Created by Matt Panzer on 6/23/13.
//  Copyright (c) 2013 Lenny Khazan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPButton : UIButton

- (id) initWithFrame: (CGRect)frame color: (UIColor*)color;
- (id) initWithFrame: (CGRect)frame color: (UIColor*)color text:(NSString*)text;

- (void) setCornerRatioWithDivisor: (int)divisor;
- (void) setBackgroundStateWithState: (BOOL)state;
- (void) setColor: (UIColor *)color;

@property (nonatomic, readwrite) int cornerRatio;
@property (nonatomic, readwrite) BOOL background;
@property (nonatomic, retain) UIColor *currentColor;

@end
