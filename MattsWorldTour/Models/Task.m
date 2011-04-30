//
//  Task.m
//  MattsWorldTour
//
//  Created by Morten Bøgh on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import "Task.h"

#import "Country.h"
#import "Category.h"

@implementation Task

@synthesize completed, country=_country, category=_category, duration=_duration;

- (BOOL)meetsRequirementTask:(Task*)reqTask
{
    // nil values are like wildcards
    if (reqTask.country && _country != reqTask.country)
    {
        return NO;
    }
    else if (reqTask.category && _category != reqTask.category)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

- (NSString *)filePathForTaskResource
{
    // Region is hardcoded
    return [NSString stringWithFormat:@"%@/%@/%@%@", kGameBundle, [_category.name lowercaseString], [_country.countryCode lowercaseString], @".png"];
}

@end