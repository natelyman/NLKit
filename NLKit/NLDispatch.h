//
//  NLDispatch.h
//  NLKit
//
//  Created by Nate Lyman on 2/9/14.
//  Copyright (c) 2014 NateLyman.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NLDispatchGenericBlock)();

void NLDispatchMainAsync(NLDispatchGenericBlock block);
void NLDispatchBackgroundAsync(NLDispatchGenericBlock block);
