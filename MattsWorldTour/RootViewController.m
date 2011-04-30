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

- (void)dealloc
{
    [super dealloc];
}

- (void)goToSpain
{	
	[UIView beginAnimations:@"CurlUpMapAndGoToCountry" context:NULL];
	[UIView setAnimationDuration:0.75];
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:YES];
	
	CountryViewController *countryVC = [[CountryViewController alloc] init];
	[self.navigationController pushViewController:countryVC animated:NO];
	[countryVC release];
	 
	[UIView commitAnimations];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToSpain)];
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