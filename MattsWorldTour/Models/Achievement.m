//
//  Achievement.m
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import "Achievement.h"

#import "Task.h"

@implementation Achievement

@synthesize type;
@synthesize requirements;

- (id)initWithType:(AchivementType)nType requirements:(NSArray *)nRequirements
{
	self = [super init];
	if (self)
	{
		completed = NO;
		self.type = nType;
		self.requirements = [NSMutableArray arrayWithArray:nRequirements];
	}
	return self;
}

- (void)addRequirementWithTask:(Task *)task
{
	[self.requirements addObject:task];
	completed = NO;
}

- (void)removeTaskFromRequirements:(Task *)task
{
	[self.requirements removeObject:task];
	completed = NO;
}

- (void)validateForCompletedTasks:(NSArray *)completedTasks
{
	if (!completed)
	{
		[self.requirements enumerateObjectsUsingBlock:^(Task *reqTask, NSUInteger reqIndex, BOOL *reqStop) {
			if (!reqTask.completed)
			{
				[completedTasks enumerateObjectsUsingBlock:^(Task *comTask, NSUInteger comIndex, BOOL *comStop) {
					if ([comTask meetsRequirementTask:reqTask] && comTask.completed == YES)
					{
						reqTask.completed = YES;
						*comStop = YES;
					}
				}];
			}
		}];
		
		__block BOOL tempCompleted = YES;
		[self.requirements enumerateObjectsUsingBlock:^(Task *reqTask, NSUInteger index, BOOL *stop) {
			if (!reqTask.completed)
			{
				tempCompleted = NO;
				*stop = YES;
			}
		}];
		
		completed = tempCompleted;
	}
}

- (BOOL)isCompleted
{	
	return completed;
}

@end