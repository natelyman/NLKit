//
//  NLNetworking.h
//  CollectionViewDemo
//
//  Created by Nate Lyman on 11/11/15.
//  Copyright © 2015 Fanatics. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^NLNetworkingCompletionHandler)(id responseObject, NSError *error);
typedef void (^NLNetworkingDataCompletionHandler)(NSData * responseObject, NSError *error);

@interface NLNetworking : NSObject

+ (instancetype)sharedInstance;

- (void)loadURL:(NSURL *)URL withCompletionHandler:(NLNetworkingCompletionHandler)completionHandler;
- (void)loadDataURL:(NSURL *)URL withCompletionHandler:(NLNetworkingDataCompletionHandler)completionHandler;

@end
