//
//  LineInstrument.h
//  Paint
//
//  Created by Ilya on 7/25/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "Instrument.h"

@interface LineInstrument  : Instrument

- (void)calcPoints:(CGPoint*) startPoint endPoint:(CGPoint*) endPoint;//to correctly calculate start and end point.
@end

