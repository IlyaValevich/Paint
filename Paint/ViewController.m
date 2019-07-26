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
@property (nonatomic,strong) CustomView *customView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.customView = [[CustomView alloc]initWithFrame:CGRectMake(0, 0, 414, 800)];
    
    [self.view addSubview:self.customView];
    
    UIButton *pointButton = [UIButton buttonWithType:UIButtonTypeSystem];
    pointButton.frame = CGRectMake(0, 800, 82.8, 82.8);
    //pointButton.backgroundColor = [UIColor redColor];
    [pointButton setBackgroundImage:[UIImage imageNamed:@"point_logo.png"] forState: UIControlStateNormal];
    [self.view addSubview:pointButton];
    
    [pointButton addTarget:self action:@selector(pointButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *lineButton = [UIButton buttonWithType:UIButtonTypeSystem];
    lineButton.frame = CGRectMake(82.8, 800, 82.8, 82.8);
    //lineButton.backgroundColor = [UIColor blueColor];
    [lineButton setBackgroundImage:[UIImage imageNamed:@"line_logo.png"] forState: UIControlStateNormal];
    [self.view addSubview:lineButton];
    
    [lineButton addTarget:self action:@selector(lineButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *ellipseButton = [UIButton buttonWithType:UIButtonTypeSystem];
    ellipseButton.frame = CGRectMake(165.6, 800, 82.8, 82.8);
    //ellipseButton.backgroundColor = [UIColor greenColor];
    [ellipseButton setBackgroundImage:[UIImage imageNamed:@"ellipse_logo.png"] forState: UIControlStateNormal];
    [self.view addSubview:ellipseButton];
    
    [ellipseButton addTarget:self action:@selector(ellipseButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    squareButton.frame = CGRectMake(248.4, 800, 82.8, 82.8);
    //squareButton.backgroundColor = [UIColor grayColor];
    [squareButton setBackgroundImage:[UIImage imageNamed:@"square_logo.png"] forState: UIControlStateNormal];
    [self.view addSubview:squareButton];
    
    [squareButton addTarget:self action:@selector(squareButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *starButton = [UIButton buttonWithType:UIButtonTypeSystem];
    starButton.frame = CGRectMake(331.2, 800, 82.8, 82.8);
    //starButton.backgroundColor = [UIColor blackColor];
    [starButton setBackgroundImage:[UIImage imageNamed:@"star_logo.png"] forState: UIControlStateNormal];
    [self.view addSubview:starButton];
    
    [starButton addTarget:self action:@selector(starButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

//self.customView.instrument = [[PointInstrument alloc]init];
//self.customView.instrument = [[LineInstrument alloc]init];
//self.customView.instrument = [[EllipseInstrument alloc]init];
//self.customView.instrument = [[SquareInstrument alloc]init];
//self.customView.instrument = [[StarInstrument alloc]init];

-(void)pointButtonAction
{
    PointInstrument *instrument = [[PointInstrument alloc]init];
    [self.customView setInstrument:instrument];
}

-(void)lineButtonAction
{
    LineInstrument *instrument = [[LineInstrument alloc]init];
    [self.customView setInstrument:instrument];
}

-(void)ellipseButtonAction
{
    self.customView.instrument = [[EllipseInstrument alloc]init];
}

-(void)squareButtonAction
{
    self.customView.instrument = [[SquareInstrument alloc]init];
}

-(void)starButtonAction
{
    self.customView.instrument = [[StarInstrument alloc]init];
}



@end
