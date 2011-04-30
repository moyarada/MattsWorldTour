//
//  Task.h
//  MattsWorldTour
//
//  Created by Morten Bøgh on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Country;
@class Category;

@interface Task : NSObject

@property (assign) BOOL completed;
@property (retain) Country *country;
@property (retain) Category *category;
@property (assign) NSTimeInterval duration;

- (BOOL)meetsRequirementTask:(Task*)task;
- (NSString *)filePathForTaskResource;
@end