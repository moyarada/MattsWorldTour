//
//  Country.m
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import "Country.h"

@implementation Country

@synthesize countryCode, countryName, categories;

+ (Country *)countryWithDictionary:(NSDictionary *)countryInfo
{
	Country *country = [[Country alloc] init];
	country.countryCode = [countryInfo objectForKey:@"code"];
	country.countryName = [countryInfo objectForKey:@"name"];
	country.categories = [countryInfo objectForKey:@"categories"];
	return [country autorelease];
}

@end