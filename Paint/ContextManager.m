//
//  StateManager.m
//  Paint
//
//  Created by Ilya on 7/25/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "ContextManager.h"

@implementation ContextManager

@synthesize context;

#pragma mark Singleton Methods

+ (id)sharedContextManager {
    static ContextManager *sharedContextManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedContextManager = [[self alloc] init];
    });
    return sharedContextManager;
}

- (id)init {
    if (self = [super init]) {
        context = UIGraphicsGetCurrentContext();
    }
    return self;
}

- (void)dealloc {
}

@end
