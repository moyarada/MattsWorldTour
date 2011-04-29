//
//  Achievement.h
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
	AchievemenTypeCountries = 0,
	AchievemenTypeCategories,
	AchievemenTypeTime
} AchivementType;

@interface Achievement : NSObject
{
	
}

@property (assign) AchivementType type;
@property (retain) NSArray *requirements;
@property (readonly, getter=isCompleted) BOOL complete;

@end