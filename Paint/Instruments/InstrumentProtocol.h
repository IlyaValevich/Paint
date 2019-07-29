//
//  Instrument.h
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

@protocol InstrumentProtocol
/*Instrument writes to a temp image from CustomView.Using line array to painting algorint.*/

@property (nonatomic,readwrite) NSMutableArray *lineArray;
@property (nonatomic,readwrite) CGPoint myBeginPoint;
@property (nonatomic,readwrite) UIImageView* tempImageView;

- (void)draw;
- (id)init:(UIImageView*) tempImageView;
@end
