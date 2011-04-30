//
//  Category.m
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import "Category.h"

@implementation Category
@synthesize type=_type;

- (BOOL)isEqual:(id)object
{
    BOOL equal = NO;
    if ([object isKindOfClass:[Category class]]) {
        if (self.type == ((Category*)object).type) {
            equal = YES;
        }
    }
    return equal;
}

- (NSString *)name
{
    return @"Name!";
}
@end