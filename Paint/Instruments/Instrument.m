//
//  Instrument.m
//  Paint
//
//  Created by Ilya on 7/30/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Instrument.h"

@implementation Instrument

@synthesize lineArray;
@synthesize myBeginPoint;
@synthesize tempImageView;

- (id)init
{
    if (self = [super init]) {
        lineArray=[[NSMutableArray alloc]init];
    }
    return self;
}


- (id)init:(UIImageView *)tempImageView
{
    if (self = [super init]) {
        self.lineArray=[[NSMutableArray alloc]init];
        self.tempImageView = tempImageView;
    }
    return self;
}

- (void)draw
{
    
}

@end
