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

/**
 起点角度:默认-0.5*M_PI
 */
@property(nonatomic, assign) CGFloat startAngle;

/**
  终点角度:默认1.5*M_PI
 */
@property(nonatomic, assign) CGFloat endAngle;

/**
 前景颜色
 */
@property(nonatomic, strong) IBInspectable UIColor *foreStrokeColor;

/**
 背景颜色
 */
@property(nonatomic, strong) IBInspectable UIColor *backStrokeColor;

/**
 进度条宽度: 默认5
 */
@property(nonatomic, assign) IBInspectable CGFloat lineWidth;

/**
 进度:0-1.0,默认0
 */
@property(nonatomic, readonly, assign) CGFloat progress;

/**
 进度变更动画时间:默认1s
 */
@property(nonatomic, assign) CGFloat animationDuration;

-(void)setProgress:(CGFloat)progress withAnimation:(BOOL)ani;
-(void)setProgressInDefaultModel:(CGFloat)progress withAnimation:(BOOL)ani;
@end
