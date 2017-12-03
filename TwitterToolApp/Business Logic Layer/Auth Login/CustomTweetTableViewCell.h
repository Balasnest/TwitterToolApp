//
//  CustomTweetTableViewCell.h
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 01/12/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import <TwitterKit/TwitterKit.h>
#import "CustomTweetView.h"

@interface CustomTweetTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet CustomTweetView *customTweetView;
@property (weak, nonatomic) IBOutlet UILabel *likesCount;
@property (weak, nonatomic) IBOutlet UILabel *retweetsCount;

- (void)configureCell:(TWTRTweet *)tweet;
@end
