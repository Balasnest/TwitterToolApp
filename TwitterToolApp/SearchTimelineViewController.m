//
//  SearchTimelineViewController.m
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 30/11/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import "SearchTimelineViewController.h"
#import <TwitterKit/TwitterKit.h>

@interface SearchTimelineViewController ()

@end

@implementation SearchTimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TWTRAPIClient *APIClient = [[TWTRAPIClient alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.dataSource = [[TWTRUserTimelineDataSource alloc]initWithScreenName:@"arrahman" APIClient:APIClient];
    });
}
@end
