//
//  StateManager.m
//  Paint
//
//  Created by Ilya on 7/25/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "StateManager.h"

@implementation StateManager

@synthesize pointArray;
@synthesize lineArray;
@synthesize myBeginPoint = _myBeginPoint;

#pragma mark Singleton Methods

+ (id)sharedStateManager {
    static StateManager *sharedStateManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStateManager = [[self alloc] init];
    });
    return sharedStateManager;
}

- (id)init {
    if (self = [super init]) {
        pointArray = [[NSMutableArray alloc] init];
        lineArray = [[NSMutableArray alloc] init];
        myBeginPoint = CGPointZero;
    }
    return self;
}

- (void)dealloc {
}

@end
