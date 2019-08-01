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

@synthesize lineArray;
@synthesize mainView;
@synthesize pointArray;
@synthesize path;
@synthesize rect;

- (id)init
{
    if (self = [super init]) {
        lineArray = [NSMutableArray new];
        pointArray = [NSMutableArray new];
    }
    return self;
}


- (id)init:(UIView *)mainView
{
    if (self = [super init]) {
        self.lineArray = [NSMutableArray new];
        self.pointArray = [NSMutableArray new];
        self.mainView = mainView;
    }
    return self;
}

- (Figure*)makeFigure
{
    return [Figure new];
}

-(void)drawFigure
{
    [[DrawManager new]drawFigure:self];
}

-(void)drawPreview
{
    [[DrawManager new]drawPreview:self];
}

-(void)drawAlgoritm:(NSMutableArray*) array
{
    
}

@end
