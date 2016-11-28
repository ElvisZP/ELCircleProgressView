//
//  ELCircleProgress.m
//  ELCircleProgress
//
//  Created by zhangpeng on 2016/11/24.
//  Copyright © 2016年 elviszp. All rights reserved.
//

#import "ELCircleProgressView.h"
#import <Foundation/Foundation.h>

@interface ELCircleProgressView()

@property(nonatomic, strong) CAShapeLayer *backLayer;
@property(nonatomic, strong) CAShapeLayer *circleLayer;

@end

@implementation ELCircleProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    [self initLayout];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    CGRect frame = self.frame;
    frame.size = self.bounds.size;
    self.frame = frame;
    [self initLayout];
    return self;
}

#pragma override
-(void)layoutSubviews{
    [super layoutSubviews];
    [self updateLayout];
}

-(void)prepareForInterfaceBuilder{
    _lineWidth = 10;
    _backStrokeColor = [UIColor grayColor];
    _foreStrokeColor = [UIColor whiteColor];
    _startAngle = -0.5 * M_PI;
    _endAngle = 1.5 * M_PI;
    _animationDuration = 1.0;
}

#pragma mark - private
- (void)initLayout{
    self.backgroundColor = [UIColor clearColor];
    self.backLayer = [[CAShapeLayer alloc] init];
    self.backLayer.strokeEnd = 1;
    self.backLayer.strokeStart = 0;
    self.backLayer.fillColor = [UIColor clearColor].CGColor;
    self.backLayer.lineCap = kCALineCapRound;
    self.backLayer.lineJoin = kCALineJoinRound;
    self.circleLayer = [[CAShapeLayer alloc] init];
    self.circleLayer.strokeEnd = 0;
    self.circleLayer.strokeStart = 0;
    self.circleLayer.fillColor = [UIColor clearColor].CGColor;
    self.circleLayer.lineCap = kCALineCapRound;
    self.circleLayer.lineJoin = kCALineJoinRound;
    [self.layer addSublayer:self.backLayer];
    [self.layer addSublayer:self.circleLayer];
    
    _lineWidth = 10;
    _backStrokeColor = [UIColor grayColor];
    _foreStrokeColor = [UIColor whiteColor];
    _startAngle = -0.5*M_PI;
    _endAngle = 1.5*M_PI;
    _animationDuration = 1.0;
    [self setNeedsLayout];
}

- (void)updateLayout{
    self.backLayer.frame = [self shapeLayerFrame];
    self.backLayer.strokeColor = self.backStrokeColor.CGColor;
    self.backLayer.path = [self shapeLayerPath].CGPath;
    self.backLayer.lineWidth = self.lineWidth;
    
    self.circleLayer.frame = [self shapeLayerFrame];
    self.circleLayer.strokeColor = self.foreStrokeColor.CGColor;
    self.circleLayer.path = [self shapeLayerPath].CGPath;
    self.circleLayer.lineWidth = self.lineWidth;
}

- (CGRect)shapeLayerFrame{
    CGFloat x = self.lineWidth / 2;
    CGFloat y = x;
    CGFloat width = self.frame.size.width - self.lineWidth;
    CGFloat height = self.frame.size.height - self.lineWidth;
    return CGRectMake(x, y, width, height);
}

- (UIBezierPath *)shapeLayerPath{
    CGFloat width = self.frame.size.width  - self.lineWidth;
    CGFloat height = self.frame.size.height  - self.lineWidth;
    return [UIBezierPath bezierPathWithArcCenter:CGPointMake(width/2, height/2) radius:width/2 startAngle:self.startAngle endAngle:self.endAngle clockwise:true];
}
#pragma mark - getter and setter

-(void)setProgress:(CGFloat)progress{
    if(_progress != progress){
        _progress = progress;
        
        CGFloat start = self.circleLayer.strokeEnd;
        self.circleLayer.strokeEnd = progress;
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.duration = self.animationDuration;
        animation.fromValue = [NSNumber numberWithFloat:start];
        animation.toValue = [NSNumber numberWithFloat:progress];
        animation.removedOnCompletion = true;
        [self.circleLayer addAnimation:animation forKey:nil];
    }
}

-(void)setBackStrokeColor:(UIColor *)backStrokeColor{
    if(_backStrokeColor != backStrokeColor){
        _backStrokeColor = backStrokeColor;
        [self setNeedsLayout];
    }
}

-(void)setForeStrokeColor:(UIColor *)foreStrokeColor{
    if(_foreStrokeColor != foreStrokeColor){
        _foreStrokeColor = foreStrokeColor;
        [self setNeedsLayout];
    }
}

-(void)setLineWidth:(CGFloat)lineWidth{
    if(_lineWidth != lineWidth){
        _lineWidth = lineWidth;
        [self setNeedsLayout];
    }
}

-(void)setStartAngle:(CGFloat)startAngle{
    if(_startAngle != startAngle){
        _startAngle = startAngle;
        [self setNeedsLayout];
    }
}

-(void)setEndAngle:(CGFloat)endAngle{
    if(_endAngle != endAngle){
        _endAngle = endAngle;
        [self setNeedsLayout];
    }
}

@end
