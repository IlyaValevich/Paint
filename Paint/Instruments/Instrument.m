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

@implementation Instrument

@synthesize lineArray;
@synthesize mainView;

- (id)init
{
    if (self = [super init]) {
        lineArray=[[NSMutableArray alloc]init];
    }
    return self;
}


- (id)init:(UIView *)mainView
{
    if (self = [super init]) {
        self.lineArray=[[NSMutableArray alloc]init];
        self.mainView = mainView;
    }
    return self;
}

- (Figure*)makeFigure
{
    return [[Figure alloc] init];
}

@end
