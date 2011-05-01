//
//  TaskViewController.m
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 MoGee. All rights reserved.
//

#import "TaskViewController.h"

#import "MattsWorldTourAppDelegate.h"
#import "Category.h"
#import "Task.h"

@implementation TaskViewController

@synthesize category, tasks, parent;
@synthesize categoryImageView, categoryNameLabel, answer1view, answer2view, answer3view;

- (id)initWithCategory:(Category *)nCategory
{
    self = [super initWithNibName:@"TaskViewController" bundle:nil];
    if (self)
	{
		self.category = nCategory;
		MattsWorldTourAppDelegate *appDelegate = (MattsWorldTourAppDelegate *)[[UIApplication sharedApplication] delegate];
		self.tasks = [appDelegate.gameManager answersForCategory:self.category];
    }
    return self;
}

- (IBAction)chooseAnswer:(UIButton *)sender
{
	[self.parent flipSignToCategoriesList];
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UIColor *imageColor;
	switch (self.category.type)
	{
		case CategoryTypeFood:
			imageColor = [UIColor redColor];
			break;
		case CategoryTypeFlag:
			imageColor = [UIColor yellowColor];
			break;
		case CategoryTypeAnthem:
			imageColor = [UIColor greenColor];
			break;
		case CategoryTypeWordsSpoken:
			imageColor = [UIColor blueColor];
			break;
		default:
			imageColor = [UIColor blackColor];
	}
	self.categoryImageView.backgroundColor = imageColor;
	
	self.categoryNameLabel.text = self.category.name;
	
	NSLog(@"Task 1: %@", [(Task *)[self.tasks objectAtIndex:0] filePathForTaskResource]);
	NSLog(@"Task 2: %@", [(Task *)[self.tasks objectAtIndex:1] filePathForTaskResource]);
	NSLog(@"Task 3: %@", [(Task *)[self.tasks objectAtIndex:2] filePathForTaskResource]);
	
	if (self.category.type == CategoryTypeFood || self.category.type == CategoryTypeFlag)
	{
		
	}
	else if (self.category.type == CategoryTypeAnthem || self.category.type == CategoryTypeWordsSpoken)
	{
		
	}
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