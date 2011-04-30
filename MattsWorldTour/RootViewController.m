//
//  RootViewController.m
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/29/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import "RootViewController.h"
#import "CountryViewController.h"



@implementation RootViewController

@synthesize mapView=mapView_;

- (void)dealloc
{
    [super dealloc];
}

- (void)zoomIn
{	
	
	// The user tapped the map, and we should zoom in, whatever that entails.
	
	// Don't do no nothing if we're already zooming.
	if (isZooming_)
		return;
	
	isZooming_ = YES;
	//zoomLevel_ = eMapZoomLevelCountry; // Temporarily force going to the country view
	
	if (zoomLevel_ == eMapZoomLevelWorld) {
		
		// Zoom to Europe map.
		
		// First add new Europe map underneath the world current map view.
		UIImageView *europeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CardZoom2.png"]];
		[[self view] insertSubview:europeView atIndex:0]; // All the way in the back
		
		// Calculate center and scale for the world view so that it zooms to a position and size that exactly matches the Europe view.
		CGPoint center = CGPointMake (890, 1594);
		CGAffineTransform scaleTransform = CGAffineTransformScale (CGAffineTransformIdentity, 5.22f, 5.22f);
		
		// Animate.
		[UIView animateWithDuration:0.7 animations:^(void) {
			[mapView_ setCenter:center];
			[mapView_ setTransform:scaleTransform];
		}
		completion:^(BOOL finished) {
			// Fade out enlarged world map, slowly revealing the fullres Europe map.
			[UIView animateWithDuration:0.3 animations:^(void) {
				[mapView_ setAlpha:0];
			} completion:^(BOOL finished) {
				[mapView_ removeFromSuperview];
				[self setMapView:europeView];
				// Set the new zoom level.
				zoomLevel_ = eMapZoomLevelCountry; //eMapZoomLevelContinent;
				isZooming_ = NO;
			}];
		}];
	}
	
	else if (zoomLevel_ == eMapZoomLevelContinent) {
		
		// Zoom to France.
		
		
	}
	
	else if (zoomLevel_ == eMapZoomLevelCountry) {
		
		// Transform to the country view (showing the question and stuff).
		
		[UIView beginAnimations:@"CurlUpMapAndGoToCountry" context:NULL];
		[UIView setAnimationDuration:0.75];
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:YES];
		
		CountryViewController *countryVC = [[CountryViewController alloc] init];
		[self.navigationController pushViewController:countryVC animated:NO];
		[countryVC release];
		 
		[UIView commitAnimations];
	}
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