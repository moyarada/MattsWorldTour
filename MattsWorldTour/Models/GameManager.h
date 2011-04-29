//
//  GameManager.h
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Task;
@interface GameManager : NSObject
{
	
}

@property (retain) NSMutableArray *achievements;
@property (retain) NSMutableArray *completedTasks;

- (void)completeTask:(Task *)task;

@end