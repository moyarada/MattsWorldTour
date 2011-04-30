//
//  Category.h
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CategoryTypeFlag = 0,
    CategoryTypeAnthem,
	CategoryTypeWordsSpoken,
	CategoryTypeWrittenText,
	CategoryTypeLandmark,
	CategoryTypeCapitalName
}
CategoryType;

@interface Category : NSObject

@property (readonly) NSString *name;
@property (assign) CategoryType type;

+ (Category *)categoryWithType:(NSString *)nTypeString;

- (CategoryType)typeFromString:(NSString *)typeString;

@end