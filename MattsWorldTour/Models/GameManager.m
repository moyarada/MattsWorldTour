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

@synthesize achievements=_achievements, tasks=_tasks, selectedCountry=_selectedCountry;

- (id)init
{
	self = [super init];
	if (self)
	{
		self.tasks = [NSMutableArray array];
		
		NSArray *countriesTemp = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Countries" ofType:@"plist"]];
		NSMutableArray *countriesArray = [[NSMutableArray alloc] init];
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
	[countries enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
		Country *country = (Country *)obj;
		if ([country.countryCode isEqualToString:@"FR"])
		{
			self.selectedCountry = country;
		}
	}];
    CGRect baguette = CGRectMake(0, 0, 0, 0);
    return baguette;
}

- (NSArray *)categoriesForSelectedCountry
{
    return _selectedCountry.categories;
}

- (NSArray *)answersForCategory:(Category *)category
{
    NSMutableArray *answers = [[[NSMutableArray alloc] initWithCapacity:kNumberOfAnswers] autorelease];
//    for (int i=0; i < kNumberOfAnswers; i++) {
//        // first is the winning answer!
//        if (i == 0) {
//            [answers addObject:[Task taskWithCountry:_selectedCountry category:_selectedCategory]];
//        }
//        else {
//        }
//    }
    [answers addObject:[Task taskWithCountry:[countries objectAtIndex:0] category:category]];
    [answers addObject:[Task taskWithCountry:[countries objectAtIndex:1] category:category]];
    [answers addObject:[Task taskWithCountry:[countries objectAtIndex:2] category:category]];
    
    return answers;
}

@end