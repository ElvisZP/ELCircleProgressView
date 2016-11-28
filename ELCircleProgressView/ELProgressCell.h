//
//  ELProgressCell.h
//  ELCircleProgressView
//
//  Created by zhangpeng on 2016/11/28.
//  Copyright © 2016年 elviszp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ELCircleProgressView;
@interface ELProgressCell : UITableViewCell
@property (weak, nonatomic) IBOutlet ELCircleProgressView *progressView;

@end
