//
//  CountryViewController.h
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 CCDC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVAudioPlayer;
@class TaskViewController;
@class Category;

@interface CountryViewController : UIViewController
{
	UIImageView *mattView_;
    AVAudioPlayer *ap;
}

@property (retain) NSArray *categories;
@property (retain) TaskViewController *taskVC;

@property (nonatomic, retain) IBOutlet UIView *signView;
@property (nonatomic, retain) IBOutlet UIView *categoriesListView;
@property (nonatomic, retain) IBOutlet UIButton *category1Button;
@property (nonatomic, retain) IBOutlet UIButton *category2Button;
@property (nonatomic, retain) IBOutlet UIButton *category3Button;
@property (nonatomic, retain) IBOutlet UIButton *category4Button;

- (IBAction)chooseCategory:(UIButton *)sender;

- (void)flipSignToTasksForCategory:(Category *)category;
- (void)flipSignToCategoriesList;

- (void)dropMatt;
- (void)danceMatt;

@end