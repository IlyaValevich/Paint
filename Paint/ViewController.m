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

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.customView = [[CustomView alloc]initWithFrame:CGRectZero];
    
    [self.view addSubview:self.customView];
    
    self.pointButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pointButton setBackgroundImage:[UIImage imageNamed:@"point_logo.png"] forState: UIControlStateNormal];
    [self.pointButton setBackgroundImage:[UIImage imageNamed:@"point_logo_selected.png"] forState: UIControlStateSelected];
    [self.view addSubview:self.pointButton];
    [self.pointButton addTarget:self action:@selector(pointButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.lineButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.lineButton setBackgroundImage:[UIImage imageNamed:@"line_logo.png"] forState: UIControlStateNormal];
    [self.lineButton setBackgroundImage:[UIImage imageNamed:@"line_logo_selected.png"] forState: UIControlStateSelected];
    [self.view addSubview:self.lineButton];
    [self.lineButton addTarget:self action:@selector(lineButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.ellipseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ellipseButton.frame = CGRectMake(165.6, 800, 82.8, 82.8);
    [self.ellipseButton setBackgroundImage:[UIImage imageNamed:@"ellipse_logo.png"] forState: UIControlStateNormal];
    [self.ellipseButton setBackgroundImage:[UIImage imageNamed:@"ellipse_logo_selected.png"] forState: UIControlStateSelected];
    [self.view addSubview:self.ellipseButton];
    [self.ellipseButton addTarget:self action:@selector(ellipseButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.squareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.squareButton setBackgroundImage:[UIImage imageNamed:@"square_logo.png"] forState: UIControlStateNormal];
    [self.squareButton setBackgroundImage:[UIImage imageNamed:@"square_logo_selected.png"] forState: UIControlStateSelected];
    [self.view addSubview:self.squareButton];
    [self.squareButton addTarget:self action:@selector(squareButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.starButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.starButton setBackgroundImage:[UIImage imageNamed:@"star_logo.png"] forState: UIControlStateNormal];
    [self.starButton setBackgroundImage:[UIImage imageNamed:@"star_logo_selected.png"] forState: UIControlStateSelected];
    [self.view addSubview:self.starButton];
    [self.starButton addTarget:self action:@selector(starButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self setupContsraints];
}

-(void)pointButtonAction
{
    self.customView.instrument =[[PointInstrument alloc]init:self.customView.mainImageView];
    
    [self selectButton:self.pointButton];
}

-(void)lineButtonAction
{
    self.customView.instrument = [[LineInstrument alloc]init:self.customView.mainImageView];
    [self selectButton:self.lineButton];;
}

-(void)ellipseButtonAction
{
    self.customView.instrument = [[EllipseInstrument alloc]init:self.customView.mainImageView];
    [self selectButton:self.ellipseButton];
}

-(void)squareButtonAction
{
    self.customView.instrument = [[SquareInstrument alloc]init:self.customView.mainImageView];
    [self selectButton:self.squareButton];
}

-(void)starButtonAction
{
    self.customView.instrument = [[StarInstrument alloc]init:self.customView.mainImageView];
    [self selectButton:self.starButton];
}

-(void)selectButton:(UIButton*)newButton{
    
    [self.selectedButton setSelected:NO];
    self.selectedButton = newButton;
    [self.selectedButton setSelected:YES];
}

-(void) setupContsraints{
    self.customView.translatesAutoresizingMaskIntoConstraints = false;
    self.customView.mainImageView.translatesAutoresizingMaskIntoConstraints = false;
    self.customView.tempImageView.translatesAutoresizingMaskIntoConstraints = false;

    [self.customView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: 0].active = YES;
    [self.customView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant: 0].active = YES;
    [self.customView.leadingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.leadingAnchor constant: -64].active = YES;
    [self.customView.trailingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor constant: 64].active = YES;

    
    [self.customView.mainImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: 0].active = YES;
    [self.customView.mainImageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant: 0].active = YES;
    [self.customView.mainImageView.leadingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.leadingAnchor constant: -64].active = YES;
    [self.customView.mainImageView.trailingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor constant: 64].active = YES;
    //self.customView.mainImageView.image = [UIImage imageNamed:@"center_test.png"];
    
    [self.customView.tempImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: 0].active = YES;
    [self.customView.tempImageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant: 0].active = YES;
    [self.customView.tempImageView.leadingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.leadingAnchor constant: -64].active = YES;
    [self.customView.tempImageView.trailingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor constant: 64].active = YES;
    
    self.pointButton.translatesAutoresizingMaskIntoConstraints = false;
    self.lineButton.translatesAutoresizingMaskIntoConstraints = false;
    self.ellipseButton.translatesAutoresizingMaskIntoConstraints = false;
    self.squareButton.translatesAutoresizingMaskIntoConstraints = false;
    self.starButton.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.pointButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-30].active = YES;
    [self.pointButton.leadingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.leadingAnchor ].active = YES;
    [self.pointButton.heightAnchor constraintEqualToAnchor:self.pointButton.widthAnchor multiplier:1.0 constant:0].active = YES;
    
    [self.lineButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-30].active = YES;
    [self.lineButton.leadingAnchor constraintEqualToAnchor:self.pointButton.layoutMarginsGuide.trailingAnchor constant:8].active = YES;
    [self.lineButton.heightAnchor constraintEqualToAnchor:self.lineButton.widthAnchor multiplier:1.0 constant:0].active = YES;
    [self.lineButton.heightAnchor constraintEqualToAnchor:self.pointButton.heightAnchor multiplier:1.0 constant:0].active = YES;
    
    [self.ellipseButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-30].active = YES;
    [self.ellipseButton.leadingAnchor constraintEqualToAnchor:self.lineButton.layoutMarginsGuide.trailingAnchor constant:8].active = YES;
    [self.ellipseButton.heightAnchor constraintEqualToAnchor:self.ellipseButton.widthAnchor multiplier:1.0 constant:0].active = YES;
    [self.ellipseButton.heightAnchor constraintEqualToAnchor:self.lineButton.heightAnchor multiplier:1.0 constant:0].active = YES;
   
    [self.squareButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-30].active = YES;
    [self.squareButton.leadingAnchor constraintEqualToAnchor:self.ellipseButton.layoutMarginsGuide.trailingAnchor constant:8].active = YES;
    [self.squareButton.heightAnchor constraintEqualToAnchor:self.squareButton.widthAnchor multiplier:1.0 constant:0].active = YES;
    [self.squareButton.heightAnchor constraintEqualToAnchor:self.ellipseButton.heightAnchor multiplier:1.0 constant:0].active = YES;
    
    [self.starButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-30].active = YES;
    [self.starButton.leadingAnchor constraintEqualToAnchor:self.squareButton.layoutMarginsGuide.trailingAnchor constant:8].active = YES;
    [self.starButton.trailingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor constant: 0].active = YES;
    [self.starButton.heightAnchor constraintEqualToAnchor:self.starButton.widthAnchor multiplier:1.0 constant:0].active = YES;
    [self.starButton.heightAnchor constraintEqualToAnchor:self.squareButton.heightAnchor multiplier:1.0 constant:0].active = YES;
   
}

@end
