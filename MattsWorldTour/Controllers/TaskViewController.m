//
//  TaskViewController.m
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 MoGee. All rights reserved.
//

#import "TaskViewController.h"

#import "MattsWorldTourAppDelegate.h"
#import "Country.h"
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

- (void)dealloc
{
    [super dealloc];
}

- (IBAction)chooseAnswer:(UIButton *)sender
{
	MattsWorldTourAppDelegate *appDelegate = (MattsWorldTourAppDelegate *)[[UIApplication sharedApplication] delegate];
	Task *chosenTask = (Task *)[self.tasks objectAtIndex:sender.tag];
	if ([chosenTask.country isEqual:appDelegate.gameManager.selectedCountry])
	{
		chosenTask.completed = YES;
	}
	else
	{
		chosenTask.completed = NO;
	}
	[appDelegate.gameManager completeTask:chosenTask];
	
	[self.parent flipSignToCategoriesList];
}

- (NSString *)fullPathForImage:(NSString *)imageName
{
	return [NSString stringWithFormat:@"%@/%@/%@", kGameBundle, self.category.folderName, imageName];
}

- (void)startPlayingAudio:(UIImageView *)sender
{
	
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
	
	self.answer1view.tag = arc4random() % [self.tasks count];
	BOOL answer2viewTagged = NO;
	while (!answer2viewTagged)
	{
		NSUInteger answer2tag = arc4random() % [self.tasks count];
		if (self.answer1view.tag != answer2tag)
		{
			self.answer2view.tag = answer2tag;
			answer2viewTagged = YES;
		}
	}
	BOOL answer3viewTagged = NO;
	while (!answer3viewTagged)
	{
		NSUInteger answer3tag = arc4random() % [self.tasks count];
		if (self.answer1view.tag != answer3tag && self.answer2view.tag != answer3tag)
		{
			self.answer3view.tag = answer3tag;
			answer3viewTagged = YES;
		}
	}
	
	if (self.category.type == CategoryTypeFood || self.category.type == CategoryTypeFlag)
	{
		NSString *answer1path = [(Task *)[tasks objectAtIndex:self.answer1view.tag] filePathForTaskResource];
		self.answer1view.image = [UIImage imageWithContentsOfFile:[self fullPathForImage:answer1path]];
		
		NSString *answer2path = [(Task *)[tasks objectAtIndex:self.answer2view.tag] filePathForTaskResource];
		self.answer2view.image = [UIImage imageWithContentsOfFile:[self fullPathForImage:answer2path]];
		
		NSString *answer3path = [(Task *)[tasks objectAtIndex:self.answer3view.tag] filePathForTaskResource];
		self.answer3view.image = [UIImage imageWithContentsOfFile:[self fullPathForImage:answer3path]];
	}
	else if (self.category.type == CategoryTypeAnthem || self.category.type == CategoryTypeWordsSpoken)
	{
		self.answer1view.image = [UIImage imageNamed:@"Sound_Play.png"];		
		self.answer2view.image = [UIImage imageNamed:@"Sound_Play.png"];
		self.answer3view.image = [UIImage imageNamed:@"Sound_Play.png"];
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