//
//  OIDAppUtilities.m
//  AppAuth
//
//  Created by Sungwoo Han on 2020/05/28.
//  Copyright © 2020 OpenID Foundation. All rights reserved.
//

#import "OIDAppUtilities.h"

@import UIKit;

@implementation OIDAppUtilities

+ (BOOL)isAppExtension {
#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
  // Documented by <a href="https://goo.gl/RRB2Up">Apple</a>
  BOOL appExtension = [[[NSBundle mainBundle] bundlePath] hasSuffix:@".appex"];
  return appExtension;
#elif TARGET_OS_OSX
  return NO;
#endif
}

+ (UIApplication *)sharedApplication
{
  Class applicationClass = nil;
  Class cls = NSClassFromString(@"UIApplication");
  if (cls && [cls respondsToSelector:NSSelectorFromString(@"sharedApplication")]) {
    applicationClass = cls;
  }
  else {
    return nil;
  }
  return [applicationClass sharedApplication];
}

+ (BOOL)canOpenURL:(NSURL *)url
{
  if ([OIDAppUtilities isAppExtension]) {
    return NO;
  }
  
  UIApplication *application = [OIDAppUtilities sharedApplication];
  return [application canOpenURL:url];
}

+ (BOOL)openURL:(NSURL *)url
{
  if ([OIDAppUtilities isAppExtension]) {
    return NO;
  }
  
  UIApplication *application = [OIDAppUtilities sharedApplication];
  
  SEL sel = NSSelectorFromString(@"openURL:");
  NSMethodSignature *methodSignature = [UIApplication instanceMethodSignatureForSelector:sel];
  NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
  [invocation setTarget:application];
  [invocation setSelector:sel];
  [invocation setArgument:&url atIndex:2];
  [invocation invoke];
  void *ret = nil;
  [invocation getReturnValue:&ret];

  return (BOOL)ret;
}

@end
