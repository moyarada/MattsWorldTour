//
//  CountryViewController.m
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import "CountryViewController.h"

#import "MattsWorldTourAppDelegate.h"
#import "TaskViewController.h"
#import "Country.h"
#import "Category.h"

@implementation CountryViewController

@synthesize categories;
@synthesize signView, category1Button, category2Button, category3Button, category4Button;

- (id)init
{
    self = [super initWithNibName:@"CountryViewController" bundle:nil];
    if (self)
	{
		GameManager *gm = ((MattsWorldTourAppDelegate *)[[UIApplication sharedApplication] delegate]).gameManager;
		self.categories = [gm categoriesForSelectedCountry];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (IBAction)chooseCategory:(UIButton *)sender
{
	[UIView animateWithDuration:0.75 animations:^{
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.signView cache:YES];
		
		TaskViewController *taskVC = [[TaskViewController alloc] initWithCategory:[self.categories objectAtIndex:sender.tag]];
		self.signView = taskVC.view;
		[taskVC release];
	}];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.category1Button.titleLabel.text = ((Category *)[self.categories objectAtIndex:self.category1Button.tag]).name;
	self.category2Button.titleLabel.text = ((Category *)[self.categories objectAtIndex:self.category2Button.tag]).name;
	self.category3Button.titleLabel.text = ((Category *)[self.categories objectAtIndex:self.category3Button.tag]).name;
	self.category4Button.titleLabel.text = ((Category *)[self.categories objectAtIndex:self.category4Button.tag]).name;
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