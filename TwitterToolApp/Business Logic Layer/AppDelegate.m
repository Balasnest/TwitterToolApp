//
//  AppDelegate.m
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 29/11/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import "AppDelegate.h"
#import <TwitterKit/TwitterKit.h>
#import "TwitterModel.h"
#import "ViewController.h"
#import "DashboardVC.h"

#define twitterKey @"GpO2c5hh9H80wxfxuc690NXNN"
#define twitterSecret @"m09oKHBNvQYCNiV7irHo4tfKWpK4Artb3jlKrDwdSGsgIIrY9K"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //twitter
    [[Twitter sharedInstance] startWithConsumerKey:twitterKey consumerSecret:twitterSecret];
    
    // Go to Login View Controller
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *ViewController= [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    self.window.rootViewController=ViewController;
    
//    //to check for user Loggedin or not
//    NSDictionary *data = [[NSUserDefaults standardUserDefaults]objectForKey:@"loggedinUser"];
//    if (data) {
//        //go to profile view
//        [[TwitterModel sharedModel]StoreSessionData:data];
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        DashboardVC *dashBoardVC= [storyboard instantiateViewControllerWithIdentifier:@"DashboardVC"];
//        self.window.rootViewController=dashBoardVC;
//    }else{
//        // Go to Login View Controller
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        ViewController *ViewController= [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//        self.window.rootViewController=ViewController;
//    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
    return [[Twitter sharedInstance] application:app openURL:url options:options];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
