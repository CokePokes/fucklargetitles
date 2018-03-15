//
//  fucklargetitles.mm
//  fucklargetitles
//
//  Created by CokePokes on 3/15/18.
//  Copyright (c) 2018 ___ORGANIZATIONNAME___. All rights reserved.
//

// CaptainHook by Ryan Petrich
// see https://github.com/rpetrich/CaptainHook/

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <Foundation/Foundation.h>
#import "CaptainHook/CaptainHook.h"

#import <UIKit/UIKit.h>

// Objective-C runtime hooking using CaptainHook:
//   1. declare class using CHDeclareClass()
//   2. load class using CHLoadClass() or CHLoadLateClass() in CHConstructor
//   3. hook method using CHOptimizedMethod()
//   4. register hook using CHHook() in CHConstructor
//   5. (optionally) call old method using CHSuper()


@interface fucklargetitles : NSObject

@end

@implementation fucklargetitles

-(id)init
{
	if ((self = [super init]))
	{
	}

    return self;
}

@end


CHDeclareClass(UINavigationBar);

CHOptimizedMethod0(self, BOOL, UINavigationBar, prefersLargeTitles)
{
    return NO;
}

CHConstructor // code block that runs immediately upon load
{
	@autoreleasepool
	{
        CHLoadLateClass(UINavigationBar);
        CHHook0(UINavigationBar, prefersLargeTitles);		
	}
}
