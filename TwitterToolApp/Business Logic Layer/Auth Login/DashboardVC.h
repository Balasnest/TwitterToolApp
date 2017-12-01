//
//  DashboardVC.h
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 29/11/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TwitterKit/TwitterKit.h>

@interface DashboardVC : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *twitterTableView;

@property (strong, nonatomic) TWTRTweetTableViewCell * prototypeCell;

- (IBAction)backAction:(id)sender;
@end
