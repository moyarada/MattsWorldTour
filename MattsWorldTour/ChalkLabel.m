//
//  ChalkLabel.m
//  MattsWorldTour
//
//  Created by Morten Bøgh on 5/1/11.
//  Copyright 2011 MoGee. All rights reserved.
//

#import "ChalkLabel.h"


@implementation ChalkLabel

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setFont:[UIFont fontWithName:@"Chalkduster" size:30.0]];
        [self setTextColor:[UIColor whiteColor]];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setFont:[UIFont fontWithName:@"Chalkduster" size:30.0]];
        [self setTextColor:[UIColor whiteColor]];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)setFontSize:(CGFloat)size
{
    [self setFont:[UIFont fontWithName:self.font.fontName size:size]];
}
@end
