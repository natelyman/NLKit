//
//  NLDefaults.h
//  NLKit
//
//  Created by Nate Lyman on 11/29/16.
//  Copyright © 2016 Nate Lyman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NLDefaults : NSObject

+ (BOOL)boolForKey:(NSString *)key;
+ (void)setBool:(BOOL)value forKey:(NSString *)key;

+ (NSString *)stringForKey:(NSString *)key;
+ (void)setString:(NSString *)value forKey:(NSString *)key;

+ (NSNumber *)numberForKey:(NSString *)key;
+ (void)setNumber:(NSNumber *)value forKey:(NSString *)key;

+ (NSInteger)integerForKey:(NSString *)key;
+ (void)setInteger:(NSInteger)value forKey:(NSString *)key;

+ (float)floatForKey:(NSString *)key;
+ (void)setFloat:(float)value forKey:(NSString *)key;

@end
