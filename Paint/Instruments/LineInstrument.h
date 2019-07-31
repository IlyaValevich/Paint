//
//  LineInstrument.h
//  Paint
//
//  Created by Ilya on 7/25/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "Instrument.h"

@interface LineInstrument  : Instrument
@property (nonatomic,readwrite) CGRect rect;

-(void)calcPoints:(CGPoint*) startPoint endPoint:(CGPoint*) endPoint;//to correctly calculate start and end point.
-(void)calcRect:(CGRect*) rect; //to correctly display the line width.
@end

