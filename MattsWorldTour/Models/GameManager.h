//
//  GameManager.h
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Category.h"
#import "Country.h"

@interface GameManager : NSObject
{
	
}

@property (retain) NSArray *achievements;
@property (retain) NSArray *completedCategories;

- (void)completeCategory:(Category *)category forCountry:(Country *)country duration:(NSTimeInterval)duration;

@end