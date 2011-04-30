//
//  MattsWorldTourAppDelegate.h
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/29/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GameManager.h"

@interface MattsWorldTourAppDelegate : NSObject <UIApplicationDelegate>
{

}

@property (retain) GameManager *gameManager;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end