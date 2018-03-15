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
