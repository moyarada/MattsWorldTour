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
    CategoryTypeAnthem
} CategoryType;

@interface Category : NSObject
{
}
@property (readonly) NSString *name;
@property (assign) CategoryType type;
@end