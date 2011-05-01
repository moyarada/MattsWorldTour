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
	[mattView_ release], mattView_ = nil;
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

	// Add the Matt subview offscreen, ready to fall down.
	mattView_ = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Matt-falling.png"]];
	CGRect frame = [mattView_ bounds];
	frame.origin = CGPointMake (24, -frame.size.height);
	[mattView_ setFrame:frame];
	[[self view] addSubview:mattView_];
}

- (void)viewDidAppear:(BOOL)animated {
	
	// Have Matt drop down from the sky.
	
	[super viewDidAppear:animated];
	
	// Schedule the drop of Matt.
	[self performSelector:@selector (dropMatt) withObject:nil afterDelay:2];
	
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


#pragma mark -

- (void)dropMatt {
	
	// Drop down Matt (later we need to animate the images within the animating view as well).
	
	[UIView beginAnimations:@"MattFalling" context:NULL];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector (didDropMatt:finished:context:)];
	
	// Calculate the new frame.
	CGRect frame = [mattView_ frame];
	frame.origin.y = [[self view] bounds].size.height - frame.size.height - 20; // Last number is bottom margin
	[mattView_ setFrame:frame];
	
	[UIView commitAnimations];

}

- (void)didDropMatt:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	// Matt was dropped, animate the landing.
	[mattView_ setImage:[UIImage imageNamed:@"Matt-landing-04.png"]];
	[mattView_ setAnimationImages:[NSArray arrayWithObjects:[UIImage imageNamed:@"Matt-landing-01.png"], [UIImage imageNamed:@"Matt-landing-02.png"], [UIImage imageNamed:@"Matt-landing-03.png"], [UIImage imageNamed:@"Matt-landing-04.png"], nil]];
	[mattView_ setAnimationDuration:0.2];
	[mattView_ setAnimationRepeatCount:1];
	[mattView_ startAnimating];
}

@end