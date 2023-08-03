//
//  OIDAppUtilities.h
//  AppAuth
//
//  Created by Sungwoo Han on 2020/05/28.
//  Copyright © 2020 OpenID Foundation. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OIDAppUtilities : NSObject

+ (BOOL)canOpenURL:(NSURL *)url;
+ (BOOL)openURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END

