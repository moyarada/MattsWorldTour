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

@synthesize achievements, completedTasks;

- (void)completeTask:(Task *)task
{
    [self.completedTasks addObject:task];
    
	//Enumerate achievements -> validate
    [achievements enumerateObjectsUsingBlock:^(id achievement, NSUInteger idx, BOOL *stop) {
//        [(Achievement *)achievement validateForCompletedCategories:self.completedCategories];
    }];
}

@end