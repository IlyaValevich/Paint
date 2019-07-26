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

@property (strong, nonatomic) id <InstrumentProtocol> instrument;
//@property (nonatomic) CGContextRef context;

@end

