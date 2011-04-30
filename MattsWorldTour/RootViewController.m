//
//  RootViewController.m
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/29/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import "RootViewController.h"

#import "MattsWorldTourAppDelegate.h"
#import "CountryViewController.h"



@implementation RootViewController

@synthesize mapView=mapView_;

- (void)dealloc
{
    [super dealloc];
}

- (void)goToSpain
{
	[((MattsWorldTourAppDelegate *)[[UIApplication sharedApplication] delegate]).gameManager rectForCountryAtPoint:CGPointMake(0, 0)];
	
	[UIView animateWithDuration:0.75 animations:^{
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:YES];
		
		CountryViewController *countryVC = [[CountryViewController alloc] init];
		[self.navigationController pushViewController:countryVC animated:NO];
		[countryVC release];
	}];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// Set initial zoom level.
	zoomLevel_ = eMapZoomLevelWorld;
	
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoomIn)];
	[self.view addGestureRecognizer:tapGesture];
	[tapGesture release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight));
}

@end