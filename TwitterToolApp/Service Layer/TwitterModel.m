//
//  TwitterModel.m
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 29/11/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import "TwitterModel.h"
#import <TwitterKit/TwitterKit.h>
#import "NSError+TwitterError.h"

//URL
#define userDetailsUrl @"https://api.twitter.com/1.1/users/show.json"
#define homeTweets @"https://api.twitter.com/1.1/statuses/home_timeline.json"

@interface TwitterModel()
    
@property(nonatomic,strong) NSDictionary *SessionData;
    
@end

@implementation TwitterModel {
    TWTRAPIClient * client;
}
+(TwitterModel *)sharedModel{
    
    static TwitterModel *sharedTwitterModel;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTwitterModel=[[TwitterModel alloc]init];
    });
    return sharedTwitterModel;
}
    
#pragma mark - allocation of twitter client
-(TWTRAPIClient*)twitterClient{
    if (!client) {
        NSString *userID = [self.SessionData objectForKey:@"userID"];
        client = [[TWTRAPIClient alloc] initWithUserID:userID];
    }
    return client;
}
    
#pragma mark - twitter Log in / OAuth
-(void)twitterLogin:(UIView*)controllerView andCallback:(void (^)(id))callback{
    
    TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error) {
        if (session) {
            NSLog(@"signed in as %@", [session userName]);
            self.SessionData = @{@"userID":session.userID,
                                 @"userName":session.userName,
                                 @"authToken":session.authToken,
                                 @"authTokenSecret":session.authTokenSecret
                                };
            [self saveDataforLoginSuccessful];
            callback([session userID]);
        } else {
            callback([NSError newErrorCode:error.code]);
        }
    }];
    // Center in Orientation
    logInButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleBottomMargin|
    UIViewAutoresizingFlexibleLeftMargin|
    UIViewAutoresizingFlexibleRightMargin;
    logInButton.autoresizesSubviews= YES;
    logInButton.center = controllerView.center;
    [controllerView addSubview:logInButton];
}

#pragma Mark - To obtain a guest token for your user
-(void)getGuestUserTokenAndCallBack:(void(^)(id))callback {
    [[Twitter sharedInstance].sessionStore fetchGuestSessionWithCompletion:^(TWTRGuestSession *guestSession, NSError *error) {
        if (guestSession) {
            self.SessionData = @{@"accessToken":guestSession.accessToken,
                                 @"guestToken":guestSession.guestToken};
            // make API calls that do not require user auth
            NSLog(@"Guest Session %@", guestSession);
            callback(guestSession.accessToken);
        } else {
            NSLog(@"error: %@", [error localizedDescription]);
        }
    }];
}

#pragma mark - get tweets
-(void)getTweetsForGuest {
    // Loading public Tweets do not require user auth
    TWTRAPIClient *client = [[TWTRAPIClient alloc] init];
    [client loadTweetWithID:@"20" completion:^(TWTRTweet *tweet, NSError *error) {
        if (tweet) {
            
        } else {
            NSLog(@"Failed to load tweet: %@", [error localizedDescription]);
        }
    }];
}

#pragma mark - get homeTimelineTweets
-(void)getHomeTweetsandCallBack:(void(^)(id))callback{
    NSString *statusesShowEndpoint = homeTweets;
    NSError *clientError;
    
    NSURLRequest *request = [[self twitterClient] URLRequestWithMethod:@"GET" URL:statusesShowEndpoint parameters:nil error:&clientError];
    
    if (request) {
        [[self twitterClient] sendTwitterRequest:request completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (data) {
                NSError *jsonError;
                id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                callback(json);
            }
            else {
                NSLog(@"Error: %@", connectionError);
                callback([NSError newErrorCode:connectionError.code]);
            }
        }];
    }
    else {
        NSLog(@"Error: %@", clientError);
        callback([NSError newErrorCode:clientError.code]);
    }
}


#pragma Mark - save Data for login successful
-(void)saveDataforLoginSuccessful{
    [[NSUserDefaults standardUserDefaults]setObject:self.SessionData forKey:@"loggedinUser"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(void)StoreSessionData:(NSDictionary*)data{
    self.SessionData = [data mutableCopy];
}
    
    

@end
