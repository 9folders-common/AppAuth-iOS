//
//  OIDAppUtilitiesIOS.m
//  AppAuth-iOS
//
//  Created by Sungwoo Han on 2020/05/28.
//  Copyright © 2020 OpenID Foundation. All rights reserved.
//

#import "OIDAppUtilitiesIOS.h"

@implementation OIDAppUtilitiesIOS

+ (BOOL)isAppExtension {
#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
  // Documented by <a href="https://goo.gl/RRB2Up">Apple</a>
  BOOL appExtension = [[[NSBundle mainBundle] bundlePath] hasSuffix:@".appex"];
  return appExtension;
#elif TARGET_OS_OSX
  return NO;
#endif
}

@end
