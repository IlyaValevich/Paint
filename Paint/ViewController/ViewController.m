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

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.customView = [[CustomView alloc] initWithFrame:CGRectZero];
    self.upperStackView = [UIStackView new];
    self.lowerStackView = [UIStackView new];
    [self.view addSubview:self.customView];
    
    
    self.pointButton = [self makeButton:self.pointButton
                               logoName:@"point_logo.png"
                       selectedLogoName:@"point_logo_selected.png"
                                 action:@selector(pointButtonAction:)];
    
    self.lineButton = [self makeButton:self.lineButton
                              logoName:@"line_logo.png"
                      selectedLogoName:@"line_logo_selected.png"
                                action:@selector(lineButtonAction:)];
    
    self.ellipseButton = [self makeButton:self.ellipseButton
                                 logoName:@"ellipse_logo.png"
                         selectedLogoName:@"ellipse_logo_selected.png"
                                   action:@selector(ellipseButtonAction:)];
    
    self.squareButton = [self makeButton:self.squareButton
                                logoName:@"square_logo.png"
                        selectedLogoName:@"square_logo_selected.png"
                                  action:@selector(squareButtonAction:)];
    
    self.starButton = [self makeButton:self.starButton
                                logoName:@"star_logo.png"
                        selectedLogoName:@"star_logo_selected.png"
                                  action:@selector(starButtonAction:)];
   
    self.clearButton = [self makeButton:self.clearButton
                              logoName:@"eraser_logo.png"
                      selectedLogoName:@"eraser_logo.png"
                                action:@selector(clearButtonAction)];
    
    
    self.colorControlButton = [self makeButton:self.colorControlButton
                                      logoName:@"color_control_logo.png"
                              selectedLogoName:@"color_control_logo_selected.png"
                                        action:@selector(colorControlButtonAction)];
    
    self.redColorButton = [self makeButton:self.redColorButton
                                  logoName:@"red_color_logo.png"
                          selectedLogoName:@"red_color_logo_selected.png"
                                    action:@selector(redColorButtonAction)];
    
    
    self.blueColorButton = [self makeButton:self.blueColorButton
                                   logoName:@"blue_color_logo.png"
                           selectedLogoName:@"blue_color_logo_selected.png"
                                     action:@selector(blueColorButtonAction)];
    
    self.greenColorButton = [self makeButton:self.greenColorButton
                                    logoName:@"green_color_logo.png"
                            selectedLogoName:@"green_color_logo_selected.png"
                                      action:@selector(greenColorButtonAction)];
    
    self.blackColorButton = [self makeButton:self.blackColorButton
                                    logoName:@"black_color_logo.png"
                            selectedLogoName:@"black_color_logo_selected.png"
                                      action:@selector(blackColorButtonAction)];
    
    self.yellowColorButton = [self makeButton:self.yellowColorButton
                                     logoName:@"yellow_color_logo.png"
                             selectedLogoName:@"yellow_color_logo_selected.png"
                                       action:@selector(yellowColorButtonAction)];
    
    self.redColorButton.alpha = 0;
    self.greenColorButton.alpha = 0;
    self.blueColorButton.alpha = 0;
    self.blackColorButton.alpha = 0;
    self.yellowColorButton.alpha = 0;
    self.redColorButton.center = self.colorControlButton.center;
    self.greenColorButton.center = self.colorControlButton.center;
    self.blueColorButton.center = self.colorControlButton.center;
    self.yellowColorButton.center = self.colorControlButton.center;
    self.blackColorButton.center = self.colorControlButton.center;
    [self setupContsraints];
    self.customView.color = [UIColor redColor].CGColor;
}

- (UIButton*)makeButton:(UIButton*)button
               logoName:(NSString*)logoName
       selectedLogoName:(NSString*)selectedLogoName
                 action:(nonnull SEL)action {
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:logoName]
                      forState: UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedLogoName]
                      forState: UIControlStateSelected];
    [self.view addSubview:button];
    [button addTarget:self
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)pointButtonAction:(UIButton* ) button {
    self.customView.instrument = [[PointInstrument alloc] init:self.customView];
    [self selectButton:button];
}

- (void)lineButtonAction:(UIButton* ) button {
    self.customView.instrument = [[LineInstrument alloc] init:self.customView];
    [self selectButton:button];
}

- (void)ellipseButtonAction:(UIButton* ) button {
    self.customView.instrument = [[EllipseInstrument alloc] init:self.customView];
    [self selectButton:button];
}

- (void)squareButtonAction:(UIButton* ) button {
    self.customView.instrument = [[SquareInstrument alloc] init:self.customView];
    [self selectButton:button];
}

- (void)starButtonAction:(UIButton* ) button {
    self.customView.instrument = [[StarInstrument alloc] init:self.customView];
    [self selectButton:button];
}

- (void)clearButtonAction {
    [self.customView clear];
    self.customView.instrument.pointArray = [NSMutableArray new];
}

- (void)redColorButtonAction {
    self.customView.color = [UIColor redColor].CGColor;
    [self hideColorsAnimation];
}

- (void)blueColorButtonAction {
    self.customView.color = [UIColor blueColor].CGColor;
    [self hideColorsAnimation];
}

- (void)greenColorButtonAction {
    self.customView.color = [UIColor greenColor].CGColor;
    [self hideColorsAnimation];
}

- (void)blackColorButtonAction {
    self.customView.color = [UIColor blackColor].CGColor;
    [self hideColorsAnimation];
}
- (void)yellowColorButtonAction {
    self.customView.color = [UIColor yellowColor].CGColor;
    [self hideColorsAnimation];
}
- (void)hideColorsAnimation{
    [UIView animateWithDuration:0.3 animations:^{
        self.redColorButton.alpha = 0;
        self.greenColorButton.alpha = 0;
        self.blueColorButton.alpha = 0;
        self.blackColorButton.alpha = 0;
        self.yellowColorButton.alpha = 0;
        self.redColorButton.center = self.colorControlButton.center;
        self.greenColorButton.center = self.colorControlButton.center;
        self.blueColorButton.center = self.colorControlButton.center;
        self.yellowColorButton.center = self.colorControlButton.center;
        self.blackColorButton.center = self.colorControlButton.center;
    }];
    self.colorsIsOpen = false;
}
- (void)showColorsAnimation{
    [UIView animateWithDuration:0.3 animations:^{
        self.yellowColorButton.center = CGPointMake(self.colorControlButton.center.x,
                                                    self.colorControlButton.center.y
                                                    + 5 * self.colorControlButton.bounds.size.height);
        self.blackColorButton.center = CGPointMake(self.colorControlButton.center.x,
                                                   self.colorControlButton.center.y
                                                   + 4 * self.colorControlButton.bounds.size.height);
        self.redColorButton.center = CGPointMake(self.colorControlButton.center.x,
                                                 self.colorControlButton.center.y
                                                 + 3 * self.colorControlButton.bounds.size.height );
        self.greenColorButton.center = CGPointMake(self.colorControlButton.center.x,
                                                   self.colorControlButton.center.y
                                                   + 2 * self.colorControlButton.bounds.size.height );
        self.blueColorButton.center = CGPointMake(self.colorControlButton.center.x,
                                                  self.colorControlButton.center.y
                                                  + self.colorControlButton.bounds.size.height);
        self.redColorButton.alpha = 1;
        self.greenColorButton.alpha = 1;
        self.blueColorButton.alpha = 1;
        self.blackColorButton.alpha = 1;
        self.yellowColorButton.alpha = 1;
    }];
    self.colorsIsOpen = true;
}
- (void)colorControlButtonAction{
    if(self.colorsIsOpen){
        [self hideColorsAnimation];
    }
    else{
        [self showColorsAnimation];
    }
}
- (void)selectButton:(UIButton*)newButton {
    [self.selectedButton setSelected:NO];
    self.selectedButton = newButton;
    [self.selectedButton setSelected:YES];
}

- (void) setupContsraints {
    
    
    
    self.pointButton.translatesAutoresizingMaskIntoConstraints = false;
    self.lineButton.translatesAutoresizingMaskIntoConstraints = false;
    self.ellipseButton.translatesAutoresizingMaskIntoConstraints = false;
    self.squareButton.translatesAutoresizingMaskIntoConstraints = false;
    self.starButton.translatesAutoresizingMaskIntoConstraints = false;
    self.clearButton.translatesAutoresizingMaskIntoConstraints = false;
    self.colorControlButton.translatesAutoresizingMaskIntoConstraints = false;
    self.redColorButton.translatesAutoresizingMaskIntoConstraints = false;
    self.greenColorButton.translatesAutoresizingMaskIntoConstraints = false;
    self.blueColorButton.translatesAutoresizingMaskIntoConstraints = false;
    self.lowerStackView.translatesAutoresizingMaskIntoConstraints = false;
    self.upperStackView.translatesAutoresizingMaskIntoConstraints = false;
    
    self.upperStackView.axis = UILayoutConstraintAxisVertical;
    self.upperStackView.distribution = UIStackViewDistributionEqualSpacing;
    self.upperStackView.alignment = UIStackViewAlignmentCenter;
    self.upperStackView.spacing = 0;
    
    [self.upperStackView addArrangedSubview:self.colorControlButton];
    [self.upperStackView addArrangedSubview:self.blueColorButton];
    [self.upperStackView addArrangedSubview:self.greenColorButton];
    [self.upperStackView addArrangedSubview:self.redColorButton];
    [self.upperStackView addArrangedSubview:self.blackColorButton];
    [self.upperStackView addArrangedSubview:self.yellowColorButton];
    
    [self.view addSubview:self.upperStackView];
    
    [self.upperStackView.topAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.topAnchor
                                                  constant: 20].active = true;
    
    [self.upperStackView.trailingAnchor
     constraintEqualToAnchor:self.clearButton.leadingAnchor ].active = YES;
    
    self.lowerStackView.axis = UILayoutConstraintAxisHorizontal;
    self.lowerStackView.distribution = UIStackViewDistributionEqualSpacing;
    self.lowerStackView.alignment = UIStackViewAlignmentCenter;
    self.lowerStackView.spacing = 0;
    
    
    [self.lowerStackView addArrangedSubview:self.pointButton];
    [self.lowerStackView addArrangedSubview:self.lineButton];
    [self.lowerStackView addArrangedSubview:self.ellipseButton];
    [self.lowerStackView addArrangedSubview:self.squareButton];
    [self.lowerStackView addArrangedSubview:self.starButton];
    
    [self.view addSubview:self.lowerStackView];
    
    [self.lowerStackView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor
                                                     constant:-30].active = true;
    [self.lowerStackView.leadingAnchor
     constraintEqualToAnchor:self.view.layoutMarginsGuide.leadingAnchor ].active = YES;
    [self.lowerStackView.trailingAnchor
     constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor ].active = YES;
    
    
    [self.pointButton.heightAnchor constraintEqualToAnchor:self.pointButton.widthAnchor
                                                multiplier:1.0
                                                  constant:0].active = YES;
    
    
    [self setEqualHeightAndWidth:self.lineButton to:self.pointButton];
    [self setEqualHeightAndWidth:self.ellipseButton to:self.pointButton];
    [self setEqualHeightAndWidth:self.squareButton to:self.pointButton];
    [self setEqualHeightAndWidth:self.starButton to:self.pointButton];
    
    
    [self.colorControlButton.heightAnchor constraintEqualToAnchor:self.colorControlButton.widthAnchor
                                                       multiplier:1.0
                                                         constant:0].active = YES;
    
    [self setEqualHeightAndWidth:self.colorControlButton to:self.pointButton];
    [self setEqualHeightAndWidth:self.redColorButton to:self.colorControlButton];
    [self setEqualHeightAndWidth:self.greenColorButton to:self.colorControlButton];
    [self setEqualHeightAndWidth:self.blueColorButton to:self.colorControlButton];
    [self setEqualHeightAndWidth:self.blackColorButton to:self.colorControlButton];
    [self setEqualHeightAndWidth:self.yellowColorButton to:self.colorControlButton];
    [self setEqualHeightAndWidth:self.clearButton to:self.pointButton];
    
    [self.clearButton.topAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.topAnchor
                                               constant: 20].active = YES;
    
    [self.clearButton.leadingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor
                                                   constant:- 64].active = YES;
    
    
    self.customView.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.customView.topAnchor constraintEqualToAnchor:self.colorControlButton.bottomAnchor
                                              constant: 0].active = YES;
    [self.customView.bottomAnchor constraintEqualToAnchor:self.lowerStackView.topAnchor
                                                 constant: 0].active = YES;
    [self.customView.leadingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.leadingAnchor
                                                  constant: -64].active = YES;
    [self.customView.trailingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor
                                                   constant: 64].active = YES;
    
}

- (void) setEqualHeightAndWidth:(UIButton*)button to:(UIButton*)mainButton{
    [button.heightAnchor constraintEqualToAnchor:button.widthAnchor
                                      multiplier:1.0
                                        constant:0].active = YES;
    [button.heightAnchor constraintEqualToAnchor:mainButton.heightAnchor
                                      multiplier:1.0
                                        constant:0].active = YES;
}

@end
