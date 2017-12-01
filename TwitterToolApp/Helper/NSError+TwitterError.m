//
//  NSError+TwitterError.m
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 29/11/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import "NSError+TwitterError.h"

@implementation NSError (TwitterError)
+ (NSError *) newErrorCode:(NSInteger)code {
    int codeInt= (int)code;
    switch (codeInt) {
        case 304:
        return [NSError errorWithDomain:@"Local" code:304 userInfo:@{@"message":@"Not Modified",@"description":@"There was no new data to return"}];
        break;
        case 400:
        return [NSError errorWithDomain:@"Local" code:400 userInfo:@{@"message":@"Bad Request",@"description":@"The request was invalid or cannot be otherwise served"}];
        break;
        case 401:
        return [NSError errorWithDomain:@"Local" code:401 userInfo:@{@"message":@"Unauthorized",@"description":@"Missing or incorrect authentication credentials"}];
        break;
        case 403:
        return [NSError errorWithDomain:@"Local" code:403 userInfo:@{@"message":@"Not Modified",@"description":@"There was no new data to return"}];
        break;
            
        default:
        return [NSError errorWithDomain:@"Local" code:codeInt userInfo:@{@"message":@"error not found",@"description":@"Something went worng"}];
        break;
    }
    return nil;
}
    
    @end
