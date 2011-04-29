//
//  Task.m
//  MattsWorldTour
//
//  Created by Morten Bøgh on 4/30/11.
//  Copyright 2011 MoGee. All rights reserved.
//

#import "Task.h"


@implementation Task
@synthesize country=country_, category=category_;

- (BOOL)meetsRequirementTask:(Task*)task
{
    BOOL equal = NO;
    if (self.country == task.country && self.category == task.category) {
    }
    
    return equal;
}

@end
