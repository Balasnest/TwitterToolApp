//
//  NSError+TwitterError.h
//  TwitterToolApp
//
//  Created by Sumit Ghosh on 29/11/17.
//  Copyright © 2017 Bala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (TwitterError)
+ (NSError *) newErrorCode:(NSInteger)code;
@end
