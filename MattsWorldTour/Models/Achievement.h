//
//  Achievement.h
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

typedef enum
{
	AchievemenTypeCountries = 0,
	AchievemenTypeCategories,
	AchievemenTypeTime
}
AchivementType;

#import <Foundation/Foundation.h>

#import "Task.h"

@interface Achievement : NSObject
{
	BOOL completed;
}

@property (assign) AchivementType type;
@property (retain) NSMutableArray *requirements;
@property (readonly, getter=isCompleted) BOOL complete;

- (id)initWithType:(AchivementType)nType requirements:(NSArray *)nRequirements;

- (void)addRequirementWithTask:(Task *)task;
- (void)validateForCompletedTasks:(NSArray *)completedTasks;

@end