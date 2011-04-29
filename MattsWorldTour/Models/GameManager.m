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

@implementation GameManager

@synthesize achievements, completedCategories;

- (void)completeCategory:(Category *)category forCountry:(Country *)country duration:(NSTimeInterval)duration
{
	//Enumerate achievements -> validate
}

@end