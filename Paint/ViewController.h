//
//  ViewController.h
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomView.h"
#import "Instruments/InstrumentProtocol.h"
@interface ViewController : UIViewController;
@property (nonatomic,strong) CustomView *customView;
@property (nonatomic,strong) UIStackView *stackView;
@property (nonatomic,strong) UIButton *pointButton;
@property (nonatomic,strong) UIButton *lineButton;
@property (nonatomic,strong) UIButton *ellipseButton;
@property (nonatomic,strong) UIButton *squareButton;
@property (nonatomic,strong) UIButton *starButton;
@property (nonatomic,strong) UIButton *clearButton;
@property (nonatomic,strong) UIButton *selectedButton;

@end

