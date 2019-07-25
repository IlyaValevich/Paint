//
//  CustomView.m
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "CustomView.h"
#import "InstrumentProtocol.h"
#import "StateManager.h"

@interface CustomView(){
    
}
@end

@implementation CustomView

- (id)init
{
    if (self = [super init]) {
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void) drawRect:(CGRect)rect
{
    [self.instrument draw];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    StateManager *sharedStateManager = [StateManager sharedStateManager];
    
    UITouch *touch = [touches anyObject];
    sharedStateManager.myBeginPoint = [touch locationInView:self];
    NSString *sPoint = NSStringFromCGPoint(sharedStateManager.myBeginPoint);
    [sharedStateManager.pointArray addObject:sPoint];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    StateManager *sharedStateManager = [StateManager sharedStateManager];
    
    NSArray *array = [NSArray arrayWithArray:sharedStateManager.pointArray];
    [sharedStateManager.lineArray addObject:array];
    sharedStateManager.pointArray = [[NSMutableArray alloc]init];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches Canelled");
}

@end
