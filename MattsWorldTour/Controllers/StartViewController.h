//
//  StartViewController.h
//  MattsWorldTour
//
//  Created by Morten Bøgh on 4/30/11.
//  Copyright 2011 MoGee. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StartViewController : UIViewController {
    
    UIButton *startButton;
}
@property (nonatomic, retain) IBOutlet UIImageView *rotatingSunImage;
@property (nonatomic, retain) IBOutlet UIButton *startButton;
- (IBAction)startAction:(id)sender;
@end
