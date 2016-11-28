//
//  ViewController.m
//  ELCircleProgress
//
//  Created by zhangpeng on 2016/11/24.
//  Copyright © 2016年 elviszp. All rights reserved.
//

#import "ViewController.h"
#import "ELCircleProgressView.h"

@interface ViewController ()
@property(nonatomic,strong) ELCircleProgressView *progressView;
@property (weak, nonatomic) IBOutlet ELCircleProgressView *progressView2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blueColor];
    self.progressView = [[ELCircleProgressView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.progressView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.progressView];
}

- (IBAction)clickButton1:(id)sender {
    self.progressView.frame = CGRectMake(50, 50, 200, 200);
    self.progressView.foreStrokeColor = [UIColor yellowColor];
}
- (IBAction)clickButton2:(id)sender {
    CGFloat progress = self.progressView.progress;
    progress += 0.1;
    [self.progressView setProgressInDefaultModel:progress withAnimation:true];
    
}
- (IBAction)clickButton3:(id)sender {
    self.progressView.startAngle = 0.7 * M_PI;
    self.progressView.endAngle = 0.3 * M_PI;
}
- (IBAction)clickButton4:(id)sender {
    self.heightConstraint.constant = 200;
    self.widthConstraint.constant = 200;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
