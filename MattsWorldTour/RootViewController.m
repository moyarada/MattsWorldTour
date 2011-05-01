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
#import "GameManager.h"

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
		UIImageView *europeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Map-Europe.png"]];
		[[self view] insertSubview:europeView atIndex:0]; // All the way in the back
		
		// Calculate center and scale for the world view so that it zooms to a position and size that exactly matches the Europe view.
		CGPoint center = CGPointMake (890, 1594);
		CGAffineTransform scaleTransform = CGAffineTransformScale (CGAffineTransformIdentity, 5.22f, 5.22f);
		
		// Animate by scaling and centering on top of existing world map. After ended animation, remove world map.
		[UIView animateWithDuration:0.7 animations:^(void) {
			[mapView_ setCenter:center];
			[mapView_ setTransform:scaleTransform];
		}
		completion:^(BOOL finished) {
			// Fade out enlarged world map, slowly revealing the fullres Europe map.
			[UIView animateWithDuration:0.3 animations:^(void) {
				[mapView_ setAlpha:0];
			} completion:^(BOOL finished) {
				// Get rid of world view
				[mapView_ removeFromSuperview];
				[self setMapView:europeView];
				// Set the new zoom level.
				zoomLevel_ = eMapZoomLevelContinent;
				isZooming_ = NO;
			}];
		}];
	}
	
	else if (zoomLevel_ == eMapZoomLevelContinent) {
		
		// Zoom to France.
		
		// First add new Europe map underneath the world current map view.
		UIImageView *franceView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Map-France.png"]];
		[[self view] insertSubview:franceView atIndex:0]; // All the way in the back
		
		// Calculate center and scale for the Europe view so that it zooms to a position and size that exactly matches the France view.
		CGPoint center = CGPointMake (860, 234);
		CGAffineTransform scaleTransform = CGAffineTransformScale (CGAffineTransformIdentity, 2.33f, 2.33f);
		
		// Animate by scaling and centering on top of existing Europe map. After ended animation, remove Europe map, and curl to question view.
		[UIView animateWithDuration:0.5 animations:^(void) {
			[mapView_ setCenter:center];
			[mapView_ setTransform:scaleTransform];
		}
		completion:^(BOOL finished) {
			// Fade out enlarged Europe map, slowly revealing the fullres France map.
			[UIView animateWithDuration:0.3 animations:^(void) {
				[mapView_ setAlpha:0];
			} completion:^(BOOL finished) {
				[mapView_ removeFromSuperview];
				[self setMapView:franceView];
				// Set the new zoom level.
				zoomLevel_ = eMapZoomLevelCountry;
				isZooming_ = NO;
				// Automatically "zoom" to the next level by calling ourselves again. We won't actually zoom, but rather transition to the next view showing the question.
				[self performSelector:@selector (zoomIn) withObject:nil afterDelay:0.4];
			}];
		}];
	}
	
	else if (zoomLevel_ == eMapZoomLevelCountry) {
		
		// Transform to the country view (showing the question and stuff).
		
//		[UIView beginAnimations:@"CurlUpMapAndGoToCountry" context:NULL];
//		[UIView setAnimationDuration:0.75];
		
		[((MattsWorldTourAppDelegate *)[[UIApplication sharedApplication] delegate]).gameManager rectForCountryAtPoint:CGPointMake(0, 0)];
		
		[UIView animateWithDuration:0.75 animations:^{
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:YES];
			
			CountryViewController *countryVC = [[CountryViewController alloc] init];
			[self.navigationController pushViewController:countryVC animated:NO];
			[countryVC release];
		}];
		 
//		[UIView commitAnimations];
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