//
//  GameManager.h
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Task;
@class Country;
@class Category;
@interface GameManager : NSObject
{
	
}

@property (retain) NSMutableArray *achievements;
@property (retain) NSMutableArray *tasks;
@property (retain) Country *selectedCountry;
@property (retain) Category *selectedCategory;

- (void)completeTask:(Task *)task;

@end