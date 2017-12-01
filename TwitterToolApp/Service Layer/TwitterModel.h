//
//  TwitterModel.h
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 29/11/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TwitterModel : NSObject
    
@property (nonatomic, strong, readonly) NSDictionary *SessionData;

+ (TwitterModel *) sharedModel;
-(void)getGuestUserTokenAndCallBack:(void(^)(id))callback;
-(void)twitterLogin:(UIView *)controllerView andCallback:(void (^)(id))callback;
-(void)GetMyProfileDetailsandCallBack:(void(^)(id))callback;
-(void)getSingleTweetsandCallBack:(void(^)(id))callback;
-(void)getHomeTweetsandCallBack:(void(^)(id))callback;

-(void)saveDataforLoginSuccessful;
-(void)StoreSessionData:(NSDictionary*)data;
    
@end
