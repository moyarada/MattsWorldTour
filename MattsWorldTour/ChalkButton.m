//
//  ChalkButton.m
//  MattsWorldTour
//
//  Created by Morten Bøgh on 5/1/11.
//  Copyright 2011 MoGee. All rights reserved.
//

#import "ChalkButton.h"
#import "ChalkLabel.h"

@implementation ChalkButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self.titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:30.0]];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
    }
    return self;
}

+ (id)buttonWithFrame:(CGRect)frame
{
    ChalkButton *btn = (ChalkButton *)[UIButton buttonWithType:UIButtonTypeCustom];
    if (btn) {
        [btn setFrame:frame];
        [btn.titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:30.0]];
    }
    return btn;
}



@end
