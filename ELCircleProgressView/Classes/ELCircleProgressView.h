//
//  ELCircleProgressView.h
//  ELCircleProgressView
//
//  Created by zhangpeng on 2016/11/24.
//  Copyright © 2016年 elviszp. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ELCircleProgressView : UIView

@property(nonatomic,assign) CGFloat startAngle;
@property(nonatomic,assign) CGFloat endAngle;
@property(nonatomic,strong) IBInspectable UIColor *foreStrokeColor;
@property(nonatomic,strong) IBInspectable UIColor *backStrokeColor;
@property(nonatomic,assign) IBInspectable CGFloat lineWidth;
@property(nonatomic,assign) CGFloat progress;
@property(nonatomic,assign) CGFloat animationDuration;
@end
