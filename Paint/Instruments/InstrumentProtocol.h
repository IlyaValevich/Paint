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
@property (readwrite) UIImageView* mainImageView;
@property (readwrite) UIImageView* tempImageView;

-(UIImageView *)draw;
//- (void)drawByContext:(CGContextRef) context;
- (id)init:(CGContextRef) context:(UIImageView*) mainImageView: (UIImageView*) tempImageView;
- (void)setContext:(CGContextRef) context;
- (void)setMainImageView:(UIImageView*) mainImageView;
- (void)setTempImageView:(UIImageView*) tempImageView;

@end
