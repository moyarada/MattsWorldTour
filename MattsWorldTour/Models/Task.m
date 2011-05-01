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

+ (Task *)taskWithCountry:(Country *)country category:(Category *)category
{
    Task *task = [[[Task alloc] init] autorelease];
    task.country = country;
    task.category = category;
    task.duration = -1;
    task.completed = NO;
    return task;
}

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
    NSString *categoryPath = [NSString stringWithFormat:@"%@/%@", kGameBundle, _category.folderName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:categoryPath]) {
        NSArray *contents = [fileManager contentsOfDirectoryAtPath:categoryPath error:nil];
        NSArray *filteredContents = [contents filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSString *file, NSDictionary *bindings) {
            BOOL match = NO;
            if ([[file substringToIndex:2] isEqualToString:[_country.countryCode lowercaseString]]) {
                match = YES;
            }
            
            return match;
        }]];
        if ([filteredContents count] > 0) {
            return [filteredContents objectAtIndex:(arc4random() % [filteredContents count])];
        }
    }
    
    return nil;
}

@end