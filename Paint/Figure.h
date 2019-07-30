//
//  Figure.h
//  Paint
//
//  Created by Ilya on 7/30/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Figure : NSObject
@property (nonatomic,readwrite) CGRect rect;
@property (nonatomic,readwrite) CGPathRef path;

- (void)draw;
- (id)init:(CGRect) rect path:(CGMutablePathRef) path;
@end
