//
//  Instrument.h
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Figure.h"

@protocol InstrumentProtocol
/*Instrument writes to a mainView from CustomView.Using line array to painting algorint.*/

@property (nonatomic,readwrite) NSMutableArray *pointArray;
@property (nonatomic,readwrite) UIView* mainView;
@property (nonatomic,readwrite) CGMutablePathRef path;
@property (nonatomic,readwrite) CGRect rect;

- (Figure *)makeFigure;
- (id)init:(UIView*) mainView;
@end
