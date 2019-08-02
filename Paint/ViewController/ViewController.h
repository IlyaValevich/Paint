//
//  ViewController.h
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomView.h"

@interface ViewController : UIViewController;
@property (nonatomic,strong) CustomView *customView;
@property (nonatomic,strong) UIStackView *upperStackView;
@property (nonatomic,strong) UIStackView *lowerStackView;
@property (nonatomic,strong) UIButton *pointButton;
@property (nonatomic,strong) UIButton *lineButton;
@property (nonatomic,strong) UIButton *ellipseButton;
@property (nonatomic,strong) UIButton *squareButton;
@property (nonatomic,strong) UIButton *starButton;
@property (nonatomic,strong) UIButton *clearButton;
@property (nonatomic,strong) UIButton *selectedButton;
@property (nonatomic,strong) UIButton *colorControlButton;
@property (nonatomic,strong) UIButton *redColorButton;
@property (nonatomic,strong) UIButton *blueColorButton;
@property (nonatomic,strong) UIButton *greenColorButton;
@property (nonatomic,strong) UIButton *blackColorButton;
@property (nonatomic,strong) UIButton *yellowColorButton;
@property (nonatomic) bool colorsIsOpen;
@end

