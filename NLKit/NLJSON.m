//
//  NLJSON.m
//  Nate Lyman
//
//  Created by Nate Lyman on 2/8/14.
//  Copyright (c) 2014 NateLyman.com. All rights reserved.
//

#import "NLJSON.h"

id NLJSONNotNSNull(id value) {
    if(![value isKindOfClass:[NSNull class]]) {
        return value;
    }
    return nil;
}

NSString * NLJSONString(id value) {
    value = NLJSONNotNSNull(value);
    
    Class klass = [NSString class];
    
    if([value isKindOfClass:klass]) {
        return (NSString *)value;
    }
    return nil;
}

NSNumber * NLJSONNumber(id value) {
    value = NLJSONNotNSNull(value);
    
    Class klass = [NSNumber class];
    
    if([value isKindOfClass:klass]) {
        return (NSNumber *)value;
    }
    return nil;
}

NSArray * NLJSONArray(id value) {
    value = NLJSONNotNSNull(value);
    
    Class klass = [NSArray class];
    
    if([value isKindOfClass:klass]) {
        return (NSArray *)value;
    }
    return nil;
}

NSDictionary * NLJSONDictionary(id value) {
    value = NLJSONNotNSNull(value);
    
    Class klass = [NSDictionary class];
    
    if([value isKindOfClass:klass]) {
        return (NSDictionary *)value;
    }
    return nil;
}