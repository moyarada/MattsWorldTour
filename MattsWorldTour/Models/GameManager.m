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

@synthesize achievements=_achievements, tasks=_tasks, selectedCountry=_selectedCountry, selectedCategory=_selectedCategory;

- (id)init
{
	self = [super init];
	if (self)
	{
		NSArray *countriesTemp = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Countries" ofType:@"plist"]];
		NSMutableArray *countriesArray = [NSMutableArray array];
		[countriesTemp enumerateObjectsUsingBlock:^(NSDictionary *countryInfo, NSUInteger index, BOOL *stop) {
			NSMutableArray *categoriesArray = [NSMutableArray array];
			Country *newCountry = [Country countryWithDictionary:countryInfo];
			[newCountry.categories enumerateObjectsUsingBlock:^(NSString *categoryTypeString, NSUInteger index, BOOL *stop) {
				Category *newCategory = [Category categoryWithType:categoryTypeString];
				[categoriesArray addObject:newCategory];
			}];
			newCountry.categories = categoriesArray;
			[countriesArray addObject:newCountry];
		}];
		countries = countriesArray;
	}
	return self;
}

- (void)completeTask:(Task *)task
{
    [_tasks addObject:task];
    
    NSArray *completedTasks = [_tasks filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"completed == YES"]];
    [_achievements enumerateObjectsUsingBlock:^(Achievement *achievement, NSUInteger index, BOOL *stop) {
        [achievement validateForCompletedTasks:completedTasks];
    }];
}

- (CGRect)rectForCountryAtPoint:(CGPoint)point
{
	[countries enumerateObjectsUsingBlock:^(Country *country, NSUInteger index, BOOL *stop) {
		if (country.countryCode)
		{
			self.selectedCountry = country;
		}
	}];
    CGRect baguette = CGRectMake(0, 0, 0, 0);
    return baguette;
}

- (NSArray *)categoriesForCountry
{
    return nil;
}

- (NSArray *)answersForCategory:(Category *)category
{
    return nil;
}

@end