//
//  CustomTweetTableViewCell.h
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 01/12/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import <TwitterKit/TwitterKit.h>
#import "CustomTweetView.h"

@interface CustomTweetTableViewCell : TWTRTweetTableViewCell
@property (weak, nonatomic) IBOutlet CustomTweetView *customTweetView;
@end
