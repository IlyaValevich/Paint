//
//  DrawManager.h
//  Paint
//
//  Created by Ilya on 8/1/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "Instrument.h"
@interface DrawManager : NSObject

- (void)drawFigure:(Instrument*) instrument;
- (Figure*)makeFigure:(Instrument*) instrument;
@end
