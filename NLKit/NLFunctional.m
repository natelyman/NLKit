//
//  NLFunctional.m
//  Nate Lyman
//
//  Created by Nate Lyman on 10/26/13.
//  Copyright (c) 2013 Nate Lyman. All rights reserved.
//

#import "NLFunctional.h"


NSArray *NLMap(NSArray *items,genericIdBlock block) {
    NSMutableArray *a = [[NSMutableArray alloc] initWithCapacity:[items count]];
    for(id item in items) {
        id b = block(item);
        if(b != nil) {
            [a addObject:b];
        }
    }
    
    return (NSArray *)a;
}