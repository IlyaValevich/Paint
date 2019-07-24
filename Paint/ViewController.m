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

@interface ViewController ()
@property (nonatomic,strong) CustomView *customView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.customView = [[CustomView alloc]initWithFrame:CGRectMake(0, 0, 414, 700)];
    self.customView.backgroundColor = [UIColor grayColor];
    self.customView->instrument = PointInstrument();
    [self.view addSubview:self.customView];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(0, 700, 82.8, 82.8);
    button1.backgroundColor = [UIColor redColor];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(82.8, 700, 82.8, 82.8);
    button2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    button3.frame = CGRectMake(165.6, 700, 82.8, 82.8);
    button3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeSystem];
    button4.frame = CGRectMake(248.4, 700, 82.8, 82.8);
    button4.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeSystem];
    button5.frame = CGRectMake(331.2, 700, 82.8, 82.8);
    button5.backgroundColor = [UIColor blackColor];
    [self.view addSubview:button5];
}



@end
