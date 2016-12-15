//
//  NLFunctional.h
//  Nate Lyman
//
//  Created by Nate Lyman on 10/26/13.
//  Copyright (c) 2013 Nate Lyman. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^genericIdBlock)(id object);

NSArray *NLMap(NSArray *items,genericIdBlock block);