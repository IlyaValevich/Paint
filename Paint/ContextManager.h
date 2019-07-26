//
//  StateManager.h
//  Paint
//
//  Created by Ilya on 7/25/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ContextManager : NSObject {
    struct CGContext *context;
}

@property (nonatomic) struct CGContext *context;

+ (id)sharedContextManager;

@end
