//
//  StartViewController.m
//  MattsWorldTour
//
//  Created by Morten Bøgh on 4/30/11.
//  Copyright 2011 MoGee. All rights reserved.
//

#import "StartViewController.h"
#import <QuartzCore/QuartzCore.h>

#define M_PI   3.14159265358979323846264338327950288   /* pi */

@implementation StartViewController
@synthesize rotatingSunImage;
@synthesize startButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [startButton release];
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
    [NSTimer scheduledTimerWithTimeInterval:6.0 target:self selector:@selector(startAnimations:) userInfo:nil repeats:NO];
}

- (void)startAnimations:(NSTimer *)sender
{
    CABasicAnimation *fullRotation; 
    fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"]; 
    fullRotation.fromValue = [NSNumber numberWithFloat:0]; 
    fullRotation.toValue = [NSNumber numberWithFloat:(2*M_PI)]; 
    fullRotation.duration = 20.0; 
    fullRotation.repeatCount = 1e100f;
    [self.rotatingSunImage.layer addAnimation:fullRotation forKey:@"matt"];
    
    [UIView animateWithDuration:0.450 animations:^(void) {
        startButton.frame = CGRectMake(409, 495, 206, 68);
    }];
}

- (void)viewDidUnload
{
    [self setStartButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight));
}

- (IBAction)startAction:(id)sender {
    [self dismissModalViewControllerAnimated:NO];
}
@end
