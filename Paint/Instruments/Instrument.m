//
//  Instrument.m
//  Paint
//
//  Created by Ilya on 7/30/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Instrument.h"
#import "Figure.h"
#import "DrawManager.h"

@implementation Instrument

@synthesize mainView;
@synthesize pointArray;
@synthesize path;
@synthesize rect;

- (id)init {
    if (self = [super init]) {
        pointArray = [NSMutableArray new];
    }
    return self;
}

- (id)init:(CustomView*)mainView {
    if (self = [super init]) {
        self.pointArray = [NSMutableArray new];
        self.mainView = mainView;
    }
    return self;
}

- (Figure*)makeFigure {
    Figure *newFigure = [[DrawManager new] makeFigure:self];
    newFigure.color = mainView.color;
    return newFigure ;
}

- (void)drawAlgoritm:(NSMutableArray*) array {
    
}

- (void)calcRect{
    self.rect = CGPathGetBoundingBox(self.path);
    self.rect = CGRectInset(self.rect,-12,-12);
}

@end
