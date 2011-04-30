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
	CountryViewController *countryVC = [[CountryViewController alloc] init];
	[self.navigationController pushViewController:countryVC animated:YES];
	[countryVC release];
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
    // Return YES for supported orientations
    return YES;
}

@end
