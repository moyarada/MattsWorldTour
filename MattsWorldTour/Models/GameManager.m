//
//  GameManager.m
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import "GameManager.h"

#import "Category.h"
#import "Country.h"
#import "Achievement.h"

@implementation GameManager

@synthesize achievements=_achievements, tasks=_tasks, selectedCountry=_selectedCountry, selectedCategory=_selectedCategory;

- (void)completeTask:(Task *)task
{
    [_tasks addObject:task];
    
	//Enumerate achievements -> validate
    NSArray *completedTasks = [_tasks filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"completed == YES"]];
    [_achievements enumerateObjectsUsingBlock:^(Achievement *achievement, NSUInteger idx, BOOL *stop) {
        [achievement validateForCompletedTasks:completedTasks];
    }];
}

@end