//
//  Country.h
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (copy) NSString *countryCode;
@property (copy) NSString *countryName;
@property (retain) NSArray *categories;

+ (Country *)countryWithDictionary:(NSDictionary *)countryInfo;

@end