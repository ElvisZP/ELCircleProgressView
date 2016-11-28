//
//  ELCustomViewController.m
//  ELCircleProgressView
//
//  Created by zhangpeng on 2016/11/28.
//  Copyright © 2016年 elviszp. All rights reserved.
//

#import "ELCustomViewController.h"
#import "ELCircleProgressView.h"

@interface ELCustomViewController (){
    NSTimer *_timer;
}
@property(nonatomic,strong) ELCircleProgressView *progressView;
@end

@implementation ELCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.progressView = [[ELCircleProgressView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:self.progressView];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(_timer == nil){
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeProgress) userInfo:nil repeats:true];
    }
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if(_timer != nil){
        [_timer invalidate];
        _timer = nil;
    }
}

-(void)changeProgress{
    CGFloat random = arc4random_uniform(100) / 100.0;
    [self.progressView setProgress:random withAnimation:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
