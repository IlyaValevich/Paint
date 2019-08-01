//
//  Instrument.h
//  Paint
//
//  Created by Ilya on 7/30/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "InstrumentProtocol.h"

@interface Instrument : NSObject <InstrumentProtocol>

- (void)drawFigure;
- (void)drawAlgoritm:(NSMutableArray*) array;
- (id)init:(UIView*) mainView;
@end
