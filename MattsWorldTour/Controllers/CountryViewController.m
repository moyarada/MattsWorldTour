//
//  CountryViewController.m
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 MoGee. All rights reserved.
//

#import "CountryViewController.h"

@implementation CountryViewController

- (id)init
{
    self = [super initWithNibName:@"CountryViewController" bundle:nil];
    if (self) {
        
    }
    return self;
}

- (void)dealloc
{
	[mattView_ release], mattView_ = nil;
	[super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
	
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
	
	// Animate him down (later we need to animate the images within the animating view as well).
	[UIView animateWithDuration:1.2 animations:^(void) {
		CGRect frame = [mattView_ frame];
		frame.origin.y = [[self view] bounds].size.height - frame.size.height - 20; // Last number is bottom margin
		[mattView_ setFrame:frame];
	}];
	
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