//
//  RootViewController.h
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/29/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	eMapZoomLevelWorld = 0,
	eMapZoomLevelContinent,
	eMapZoomLevelCountry,
} MapZoomLevel;

@interface RootViewController : UIViewController
{
	// Call me a pussy, but I like to easily see what's an instance var
	MapZoomLevel zoomLevel_;
	BOOL isZooming_;
}

@property (nonatomic, retain) IBOutlet UIImageView *mapView;

@end