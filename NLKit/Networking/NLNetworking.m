//
//  NLNetworking.m
//  CollectionViewDemo
//
//  Created by Nate Lyman on 11/11/15.
//  Copyright © 2015 Fanatics. All rights reserved.
//

#import "NLNetworking.h"

@interface NLNetworking()
@property (nonatomic, strong) NSMutableDictionary<NSURLRequest *,NLNetworkingCompletionHandler> *completionHandlers;
@end

@implementation NLNetworking

+ (instancetype)sharedInstance {
    static NLNetworking *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[NLNetworking alloc] init];
    });
    return __sharedInstance;
}

- (instancetype)init {
    self = [super init];
    
    if(self) {
        self.completionHandlers = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)loadURL:(NSURL *)URL withCompletionHandler:(NLNetworkingCompletionHandler)completionHandler {
    if(!URL) return;
    if(!completionHandler) return;
    
    __block NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self.completionHandlers setObject:completionHandler forKey:request];
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NLNetworkingCompletionHandler handler = self.completionHandlers[request];
        [self.completionHandlers removeObjectForKey:request];
        
        if(error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                handler(nil,error);
            });
            return;
        }
        
        if(data) {
            NSError *err;
            id responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
            if(err) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completionHandler(nil,err);
                });
                return;
            }
            if(responseObject) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    completionHandler(responseObject,error);
                });
                return;
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(nil,nil);
        });
            
    }] resume];
}


- (void)loadDataURL:(NSURL *)URL withCompletionHandler:(NLNetworkingDataCompletionHandler)completionHandler {
    if(!URL) return;
    if(!completionHandler) return;
    
    __block NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self.completionHandlers setObject:completionHandler forKey:request];
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NLNetworkingCompletionHandler handler = self.completionHandlers[request];
        [self.completionHandlers removeObjectForKey:request];
        
        if(error) {
            return handler(nil,error);
        }
        
        if(data) {
            return completionHandler(data,error);
        }
        
        return completionHandler(nil,nil);
    }] resume];
}

@end
