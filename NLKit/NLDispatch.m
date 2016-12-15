//
//  NLDispatch.m
//  NLKit
//
//  Created by Nate Lyman on 2/9/14.
//  Copyright (c) 2014 NateLyman.com. All rights reserved.
//

#import "NLDispatch.h"

static dispatch_queue_t nl_background_queue;

void NLDispatchMainAsync(NLDispatchGenericBlock block) {
    dispatch_async(dispatch_get_main_queue(),block);
}
void NLDispatchBackgroundAsync(NLDispatchGenericBlock block) {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        nl_background_queue = dispatch_queue_create("com.natelyman.nlkit.bgqueue", 0);
    });
    dispatch_async(nl_background_queue,block);
}