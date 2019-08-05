//
//  Figure.m
//  Paint
//
//  Created by Ilya on 7/30/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Figure.h"
@implementation Figure
@synthesize rect;
@synthesize path;
@synthesize color;

- (id)init{
    if (self = [super init]) {
        self.rect = CGRectNull;
        self.path = CGPathCreateMutable();
    }
    return self;
}

- (id)init:(CGRect) rect path:(CGMutablePathRef) path {
    if (self = [super init]) {
        self.rect = rect;
        self.path = path;
    }
    return self;
}

- (void)draw {
    if(self.path){
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGPathRef thickPath = CGPathCreateCopyByStrokingPath(path, NULL, 8, kCGLineCapRound, kCGLineJoinRound, 0);
        
        CGContextAddPath(context, thickPath);
        
        CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
        CGContextSetFillColorWithColor(context, color);
        CGContextSetLineWidth(context, 8);
        CGContextDrawPath(context, kCGPathFillStroke);
        
        CGPathRelease(thickPath);
    }
}

@end
