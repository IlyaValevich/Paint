//
//  StateManager.h
//  Paint
//
//  Created by Ilya on 7/25/19.
//  Copyright © 2019 Ilya. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StateManager : NSObject {
  
    NSMutableArray *pointArray;
    NSMutableArray *lineArray;
    CGPoint myBeginPoint;
}

@property (nonatomic, retain) NSMutableArray *pointArray;
@property (nonatomic, retain) NSMutableArray *lineArray;
@property (nonatomic) CGPoint myBeginPoint;

+ (id)sharedStateManager;

@end
