//
//  Instrument.h
//  Paint
//
//  Created by Ilya on 7/30/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "InstrumentProtocol.h"
#import "CustomView.h"

@interface Instrument : NSObject <InstrumentProtocol>
@property (nonatomic,readwrite) CustomView* mainView;

- (void)drawFigure;
- (void)drawAlgoritm:(NSMutableArray*) array;
- (void)calcRect;
- (id)init:(CustomView*) mainView;
@end
