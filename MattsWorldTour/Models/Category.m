//
//  Category.m
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import "Category.h"

@implementation Category

@synthesize type=_type;

+ (Category *)categoryWithType:(NSString *)nTypeString
{
	Category *category = [[Category alloc] init];
	category.type = [category typeFromString:nTypeString];
	return [category autorelease];
}

- (BOOL)isEqual:(id)object
{
    BOOL equal = NO;
    if ([object isKindOfClass:[Category class]])
	{
        if (self.type == ((Category*)object).type)
		{
            equal = YES;
        }
    }
    return equal;
}

- (NSString *)name
{
	NSString *name = nil;
	
	if (self.type == CategoryTypeFlag)
	{
		name = @"Flag";
	}
	else if (self.type == CategoryTypeAnthem)
	{
		name = @"National anthem";
	}
	else if (self.type == CategoryTypeWordsSpoken)
	{
		name = @"Spoken words";
	}
	else if (self.type == CategoryTypeFood)
	{
		name = @"Food";
	}
	
	return name;
}

- (NSString *)folderName
{
	NSString *name = nil;
	
	if (self.type == CategoryTypeFlag)
	{
		name = @"flag";
	}
	else if (self.type == CategoryTypeAnthem)
	{
		name = @"anthem";
	}
	else if (self.type == CategoryTypeWordsSpoken)
	{
		name = @"speech";
	}
	else if (self.type == CategoryTypeFood)
	{
		name = @"food";
	}
	
	return name;
}

- (CategoryType)typeFromString:(NSString *)typeString
{
	CategoryType type;
	if ([typeString isEqualToString:@"Flag"])
	{
		type = CategoryTypeFlag;
	}
	else if ([typeString isEqualToString:@"Anthem"])
	{
		type = CategoryTypeAnthem;
	}
	else if ([typeString isEqualToString:@"WordsSpoken"])
	{
		type = CategoryTypeWordsSpoken;
	}
	else
	{
		type = CategoryTypeFood;
	}
	
	return type;
}

@end