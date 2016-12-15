//
//  NLJSON.h
//  Nate Lyman
//
//  Created by Nate Lyman on 2/8/14.
//  Copyright (c) 2014 NateLyman.com. All rights reserved.
//

#import <Foundation/Foundation.h>

id NLJSONNotNSNull(id value);
NSString * NLJSONString(id value);
NSNumber * NLJSONNumber(id value);
NSArray * NLJSONArray(id value);
NSDictionary * NLJSONDictionary(id value);