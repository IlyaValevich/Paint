//
//  Instrument.h
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

@protocol InstrumentProtocol

@property (nonatomic,readwrite) NSMutableArray *pointArray;
@property (nonatomic,readwrite) NSMutableArray *lineArray;
@property (nonatomic,readwrite) CGPoint myBeginPoint;
@property (nonatomic,readwrite) UIImageView* tempImageView;


- (UIImage *)draw;
- (id)init:(UIImageView*) tempImageView;


//- (id)init:(CGContextRef) context mainImageView:
/*
- (void)setContext:(CGContextRef) context;
- (void)setMainImageView:(UIImageView*) mainImageView;
- (void)setTempImageView:(UIImageView*) tempImageView;
*/
@end
