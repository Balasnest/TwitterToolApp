//
//  ViewController.m
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 29/11/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import "ViewController.h"
#import "TwitterModel.h"
#import "DashboardVC.h"
#import "ParentViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [[TwitterModel sharedModel]twitterLogin:self.view andCallback:^(id response) {
        if (![response isKindOfClass:[NSError class]]) {
            NSLog(@"SUCCESS: %@",response);
            DashboardVC *dashBoard =  [self.storyboard instantiateViewControllerWithIdentifier:@"DashboardVC"];
            [self presentViewController:dashBoard animated:YES completion:nil];
        }else{
            NSLog(@"Login issue");
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginAsGuestBtn:(id)sender {
    ParentViewController *dashBoard =  [self.storyboard instantiateViewControllerWithIdentifier:@"ParentViewController"];
    [self presentViewController:dashBoard animated:YES completion:nil];
}
@end
