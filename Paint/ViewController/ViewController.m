//
//  ViewController.m
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import "PointInstrument.h"
#import "LineInstrument.h"
#import "EllipseInstrument.h"
#import "SquareInstrument.h"
#import "StarInstrument.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.customView = [[CustomView alloc] initWithFrame:CGRectZero];
    self.stackView = [[UIStackView alloc] init];
    [self.view addSubview:self.customView];
    
    self.pointButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pointButton setBackgroundImage:[UIImage imageNamed:@"point_logo.png"]
                                forState: UIControlStateNormal];
    [self.pointButton setBackgroundImage:[UIImage imageNamed:@"point_logo_selected.png"]
                                forState: UIControlStateSelected];
    [self.view addSubview:self.pointButton];
    [self.pointButton addTarget:self
                         action:@selector(pointButtonAction:)
               forControlEvents:UIControlEventTouchUpInside];
    
    
    self.lineButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.lineButton setBackgroundImage:[UIImage imageNamed:@"line_logo.png"]
                               forState: UIControlStateNormal];
    [self.lineButton setBackgroundImage:[UIImage imageNamed:@"line_logo_selected.png"]
                               forState: UIControlStateSelected];
    [self.view addSubview:self.lineButton];
    [self.lineButton addTarget:self
                        action:@selector(lineButtonAction:)
              forControlEvents:UIControlEventTouchUpInside];
    
    
    self.ellipseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.ellipseButton setBackgroundImage:[UIImage imageNamed:@"ellipse_logo.png"]
                                  forState: UIControlStateNormal];
    [self.ellipseButton setBackgroundImage:[UIImage imageNamed:@"ellipse_logo_selected.png"]
                                  forState: UIControlStateSelected];
    [self.view addSubview:self.ellipseButton];
    [self.ellipseButton addTarget:self
                           action:@selector(ellipseButtonAction:)
                 forControlEvents:UIControlEventTouchUpInside];
    
    
    self.squareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.squareButton setBackgroundImage:[UIImage imageNamed:@"square_logo.png"]
                                 forState: UIControlStateNormal];
    [self.squareButton setBackgroundImage:[UIImage imageNamed:@"square_logo_selected.png"]
                                 forState: UIControlStateSelected];
    [self.view addSubview:self.squareButton];
    [self.squareButton addTarget:self
                          action:@selector(squareButtonAction:)
                forControlEvents:UIControlEventTouchUpInside];
    
    
    self.starButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.starButton setBackgroundImage:[UIImage imageNamed:@"star_logo.png"]
                               forState: UIControlStateNormal];
    [self.starButton setBackgroundImage:[UIImage imageNamed:@"star_logo_selected.png"]
                               forState: UIControlStateSelected];
    [self.view addSubview:self.starButton];
    [self.starButton addTarget:self
                        action:@selector(starButtonAction:)
              forControlEvents:UIControlEventTouchUpInside];
    
    
    self.clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.clearButton setBackgroundImage:[UIImage imageNamed:@"eraser_logo.png"]
                                forState: UIControlStateNormal];
    [self.view addSubview:self.clearButton];
    [self.clearButton addTarget:self
                         action:@selector(clearButtonAction)
               forControlEvents:UIControlEventTouchUpInside];
    
    
    [self setupContsraints];
}

-(void)pointButtonAction:(UIButton* ) button
{
    self.customView.instrument = [[PointInstrument alloc] init:self.customView];
    [self selectButton:button];
}

-(void)lineButtonAction:(UIButton* ) button
{
    self.customView.instrument = [[LineInstrument alloc] init:self.customView];
    [self selectButton:button];
}

-(void)ellipseButtonAction:(UIButton* ) button
{
    self.customView.instrument = [[EllipseInstrument alloc] init:self.customView];
    [self selectButton:button];
}

-(void)squareButtonAction:(UIButton* ) button
{
    self.customView.instrument = [[SquareInstrument alloc] init:self.customView];
    [self selectButton:button];
}

-(void)starButtonAction:(UIButton* ) button
{
    self.customView.instrument = [[StarInstrument alloc] init:self.customView];
    [self selectButton:button];
}

-(void)clearButtonAction
{
    [self.customView clear];
    self.customView.instrument.lineArray=[[NSMutableArray alloc] init];
}

-(void)selectButton:(UIButton*)newButton
{
    [self.selectedButton setSelected:NO];
    self.selectedButton = newButton;
    [self.selectedButton setSelected:YES];
}

-(void) setupContsraints
{
    self.customView.translatesAutoresizingMaskIntoConstraints = false;

    [self.customView.topAnchor constraintEqualToAnchor:self.view.topAnchor
                                              constant: 0].active = YES;
    [self.customView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor
                                                 constant: 0].active = YES;
    [self.customView.leadingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.leadingAnchor
                                                  constant: -64].active = YES;
    [self.customView.trailingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor
                                                   constant: 64].active = YES;

    
    self.pointButton.translatesAutoresizingMaskIntoConstraints = false;
    self.lineButton.translatesAutoresizingMaskIntoConstraints = false;
    self.ellipseButton.translatesAutoresizingMaskIntoConstraints = false;
    self.squareButton.translatesAutoresizingMaskIntoConstraints = false;
    self.starButton.translatesAutoresizingMaskIntoConstraints = false;
    self.clearButton.translatesAutoresizingMaskIntoConstraints = false;
    
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.distribution = UIStackViewDistributionEqualSpacing;
    self.stackView.alignment = UIStackViewAlignmentCenter;
    self.stackView.spacing = 0;
    
    
    [self.stackView addArrangedSubview:self.pointButton];
    [self.stackView addArrangedSubview:self.lineButton];
    [self.stackView addArrangedSubview:self.ellipseButton];
    [self.stackView addArrangedSubview:self.squareButton];
    [self.stackView addArrangedSubview:self.starButton];
    
    self.stackView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:self.stackView];
    
    [self.stackView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor
                                                constant:-30].active = true;
    [self.stackView.leadingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.leadingAnchor ].active = YES;
    [self.stackView.trailingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor ].active = YES;
    
    
    [self.pointButton.heightAnchor constraintEqualToAnchor:self.pointButton.widthAnchor
                                                multiplier:1.0
                                                  constant:0].active = YES;
    
    
    [self.lineButton.heightAnchor constraintEqualToAnchor:self.lineButton.widthAnchor
                                               multiplier:1.0
                                                 constant:0].active = YES;
    [self.lineButton.heightAnchor constraintEqualToAnchor:self.pointButton.heightAnchor
                                               multiplier:1.0
                                                 constant:0].active = YES;
    
    
    [self.ellipseButton.heightAnchor constraintEqualToAnchor:self.ellipseButton.widthAnchor
                                                  multiplier:1.0
                                                    constant:0].active = YES;
    [self.ellipseButton.heightAnchor constraintEqualToAnchor:self.lineButton.heightAnchor
                                                  multiplier:1.0
                                                    constant:0].active = YES;
    
    
    [self.squareButton.heightAnchor constraintEqualToAnchor:self.squareButton.widthAnchor
                                                 multiplier:1.0
                                                   constant:0].active = YES;
    [self.squareButton.heightAnchor constraintEqualToAnchor:self.ellipseButton.heightAnchor
                                                 multiplier:1.0
                                                   constant:0].active = YES;
    
    
    [self.starButton.heightAnchor constraintEqualToAnchor:self.starButton.widthAnchor
                                               multiplier:1.0
                                                 constant:0].active = YES;
    [self.starButton.heightAnchor constraintEqualToAnchor:self.squareButton.heightAnchor
                                               multiplier:1.0
                                                 constant:0].active = YES;
    
    
    [self.clearButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:40].active = YES;
    [self.clearButton.trailingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor
                                                    constant: 0].active = YES;
    [self.clearButton.heightAnchor constraintEqualToAnchor:self.clearButton.widthAnchor
                                                multiplier:1.0
                                                  constant:0].active = YES;
    [self.clearButton.heightAnchor constraintEqualToAnchor:self.pointButton.heightAnchor
                                                multiplier:1.0
                                                  constant:0].active = YES;
     
}

@end
