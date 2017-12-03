//
//  CustomTweetTableViewCell.m
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 01/12/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import "CustomTweetTableViewCell.h"
#import <TwitterKit/TwitterKit.h>

@implementation CustomTweetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCell:(TWTRTweet *)tweet{
    self.customTweetView.showActionButtons = true;
    [self.customTweetView configureWithTweet:tweet];
    self.likesCount.text = [NSString stringWithFormat:@"%lld", tweet.likeCount];
    self.retweetsCount.text = [NSString stringWithFormat:@"%lld", tweet.retweetCount];
}

@end
