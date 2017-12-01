//
//  DashboardVC.m
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 29/11/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import "DashboardVC.h"
#import "TwitterModel.h"
#import <TwitterKit/TwitterKit.h>
#import "CustomTweetTableViewCell.h"
#import "CustomTweetView.h"

#define tweetTableCellReuseIdentifier @"CustomTweetTableViewCell"

@interface DashboardVC () <TWTRTweetViewDelegate, UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray * tweets;
@property (strong, nonatomic) NSMutableArray * tweetHeights;


@end

@implementation DashboardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialization
    self.tweets = [[NSArray alloc]init];
    self.tweetHeights = [[NSMutableArray alloc]init];
    
    // Register the identifier for TWTRTweetTableViewCell
    [self.twitterTableView registerClass:[CustomTweetTableViewCell class] forCellReuseIdentifier:tweetTableCellReuseIdentifier];
    
    [self loadTweets];
    
}

- (void)loadTweets {
    [[TwitterModel sharedModel]getHomeTweetsandCallBack:^(NSArray * array) {
        if(array !=nil){
            self.tweets = [TWTRTweet tweetsWithJSONArray:array];
            
            // Create a single prototype cell for height calculations.
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.twitterTableView reloadData];
            });
        }
        else
            NSLog(@"jsonTweets are not an array of Objects");
    }];
}

#pragma mark - tableview delegate and datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tweets.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTweetTableViewCell * cell = (CustomTweetTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tweetTableCellReuseIdentifier forIndexPath:indexPath];
    
    // Assign the delegate to control events on Tweets.
    cell.tweetView.delegate = self;
    
    cell.tweetView.showActionButtons = true;
    
    // Retrieve the Tweet model from loaded Tweets.
    TWTRTweet * tweet = self.tweets[indexPath.row];
    
    // Configure the cell with the Tweet.
    [cell.tweetView configureWithTweet:tweet];
    
    // Return the Tweet cell.
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TWTRTweet * tweet = self.tweets[indexPath.row];
    if (self.tweets.count > indexPath.row) {
        [self.prototypeCell configureWithTweet:tweet];
    }
    CGFloat tweetHeight = [CustomTweetTableViewCell heightForTweet:tweet style:TWTRTweetViewStyleCompact width:[tableView bounds].size.width showingActions:YES];
    
    self.tweetHeights[indexPath.row] = [NSNumber numberWithFloat:tweetHeight];
    
    return tweetHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
