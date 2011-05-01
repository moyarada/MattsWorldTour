//
//  TaskViewController.h
//  MattsWorldTour
//
//  Created by Morten Gregersen on 4/30/11.
//  Copyright 2011 MoGee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CountryViewController.h"
#import "Category.h"

@interface TaskViewController : UIViewController
{
	
}

@property (retain) Category *category;
@property (retain) NSArray *tasks;
@property (retain) CountryViewController *parent;

@property (nonatomic, retain) IBOutlet UIImageView *categoryImageView;
@property (nonatomic, retain) IBOutlet UILabel *categoryNameLabel;
@property (nonatomic, retain) IBOutlet UIButton *answer1view;
@property (nonatomic, retain) IBOutlet UIButton *answer2view;
@property (nonatomic, retain) IBOutlet UIButton *answer3view;

- (id)initWithCategory:(Category *)nCategory;

- (IBAction)chooseAnswer:(UIButton *)sender;

- (NSString *)fullPathForAsset:(NSString *)assetName;

@end