//
//  Instrument.h
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

@protocol InstrumentProtocol

@property (readwrite) NSMutableArray *pointArray;
@property (readwrite) NSMutableArray *lineArray;
@property (readwrite) CGPoint myBeginPoint;
@property (readwrite) CGContextRef context;

- (CGContextRef)draw;
//- (void)drawByContext:(CGContextRef) context;
- (id)init:(CGContextRef) context;
- (void)setContext:(CGContextRef) context;
@end
