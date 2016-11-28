//
//  ELProgressCell.m
//  ELCircleProgressView
//
//  Created by zhangpeng on 2016/11/28.
//  Copyright © 2016年 elviszp. All rights reserved.
//

#import "ELProgressCell.h"
#import "ELCircleProgressView.h"
#import "ELTableViewController.h"

@implementation ELProgressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeProgress) name:ELProgressChange object:nil];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ELProgressChange object:nil];
}

-(void)changeProgress{
    CGFloat progress = self.progressView.progress;
    progress += 0.1;
    if(progress > 1){
        progress = 0;
    }
//    [self.progressView setProgress:progress withAnimation:true];
    [self.progressView setProgressInDefaultModel:progress withAnimation:true];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
