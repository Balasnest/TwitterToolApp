//
//  ParentViewController.m
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 01/12/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import "ParentViewController.h"
#import "SearchTimelineViewController.h"


@interface ParentViewController ()

@end

@implementation ParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SearchTimelineViewController * searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchTimelineViewController"];
    [self addChildViewController:searchVC];
    [searchVC.view setFrame:CGRectMake(0.0f, 0.0f, self.containerView.frame.size.width, self.containerView.frame.size.height)];
    [self.containerView addSubview:searchVC.view];
    [searchVC didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)logoutBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
