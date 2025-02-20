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
	country.countryCode = [countryInfo objectForKey:@"countryCode"];
	country.countryName = [countryInfo objectForKey:@"countryName"];
	country.categories = [countryInfo objectForKey:@"categories"];
	return [country autorelease];
}

- (BOOL)isEqual:(id)object
{
    BOOL equal = NO;
    if ([object isKindOfClass:[Country class]]) {
        if ([self.countryCode isEqualToString:((Country*)object).countryCode]) {
            equal = YES;
        }
    }
    return equal;
}

@end