//
//  CustomView.h
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstrumentProtocol.h"

@interface CustomView : UIView
@property (nonatomic,readwrite) id <InstrumentProtocol> instrument;
@property (nonatomic,readwrite) NSMutableArray *pointArray;
@property (nonatomic,strong) NSMutableArray<Figure *> *figuresArray;
@property (nonatomic,readwrite) CGColorRef color;

-(void)clear;
@end

