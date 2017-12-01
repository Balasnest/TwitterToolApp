//
//  ParentViewController.h
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 01/12/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchTimelineViewController.h"

@interface ParentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *containerView;

- (IBAction)logoutBtn:(id)sender;

@end
