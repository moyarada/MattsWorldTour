//
//  MattsWorldTourAppDelegate.h
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/29/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MattsWorldTourViewController;

@interface MattsWorldTourAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MattsWorldTourViewController *viewController;

@end
