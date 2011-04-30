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

@synthesize achievements, tasks;

- (void)completeTask:(Task *)task
{
    [self.tasks addObject:task];
    
	//Enumerate achievements -> validate
    NSArray *completedTasks = [tasks filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"completed == YES"]];
    [achievements enumerateObjectsUsingBlock:^(id achievement, NSUInteger idx, BOOL *stop) {
        [(Achievement *)achievement validateForCompletedTasks:completedTasks];
    }];
}

@end