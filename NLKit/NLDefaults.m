//
//  NLDefaults.m
//  NLKit
//
//  Created by Nate Lyman on 11/29/16.
//  Copyright © 2016 Nate Lyman. All rights reserved.
//

#import "NLDefaults.h"

@interface NLDefaults()
@property (nonatomic,strong) NSUserDefaults *defaults;
@end

@implementation NLDefaults

+ (instancetype)sharedDefaults {
    static NLDefaults *__sharedDefaults;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedDefaults = [[NLDefaults alloc] init];
    });
    return __sharedDefaults;
}

- (instancetype)init {
    self = [super init];
    if(self) {
        self.defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.natelyman.Affiliate"];
    }
    return self;
}

+ (NSUserDefaults *)standardDefaults {
    return [[NLDefaults sharedDefaults] defaults];
}

+ (BOOL)boolForKey:(NSString *)key {
    return [[NLDefaults standardDefaults] boolForKey:key];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)key {
    [[NLDefaults standardDefaults] setBool:value forKey:key];
    [[NLDefaults standardDefaults] synchronize];
}

+ (NSString *)stringForKey:(NSString *)key {
    return [[NLDefaults standardDefaults] stringForKey:key];
}

+ (void)setString:(NSString *)value forKey:(NSString *)key {
    [[NLDefaults standardDefaults] setObject:value forKey:key];
}

+ (NSNumber *)numberForKey:(NSString *)key {
    return (NSNumber *)[[NLDefaults standardDefaults] objectForKey:key];
}

+ (void)setNumber:(NSNumber *)value forKey:(NSString *)key {
    [[NLDefaults standardDefaults] setObject:value forKey:key];
    [[NLDefaults standardDefaults] synchronize];
}

+ (NSInteger)integerForKey:(NSString *)key {
    return [[NLDefaults standardDefaults] integerForKey:key];
}

+ (void)setInteger:(NSInteger)value forKey:(NSString *)key {
    [[NLDefaults standardDefaults] setInteger:value forKey:key];
    [[NLDefaults standardDefaults] synchronize];
}

+ (float)floatForKey:(NSString *)key {
    return [[NLDefaults standardDefaults] floatForKey:key];
}

+ (void)setFloat:(float)value forKey:(NSString *)key {
    [[NLDefaults standardDefaults] setFloat:value forKey:key];
    [[NLDefaults standardDefaults] synchronize];
}

@end
