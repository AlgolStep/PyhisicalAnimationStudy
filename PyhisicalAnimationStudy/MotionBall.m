//
//  MotionBall.m
//  PyhisicalAnimationStudy
//
//  Created by 思来氏 on 15/6/16.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import "MotionBall.h"

@interface MotionBall ()
@property (assign,nonatomic) double velocity;
@end

@implementation MotionBall

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _cmMotionManager = [[CMMotionManager alloc] init];
        self.velocity = 100.0;
    }
    return self;
}
/**
 *  lazy init
 */
- (CMMotionManager*)cmMotionManager{
    if (!_cmMotionManager) {
        _cmMotionManager = [[CMMotionManager alloc] init];
    }
    return _cmMotionManager;
}


/**
 *  开始移动
 */
- (void)startUpdateMotion{
//    设置采集更新的频率 单位是秒 s
    NSTimeInterval updateInterval = 0.07;
    CGSize size = [self superview].frame.size;
    __block CGRect fframe = [self frame];
//    在block中 只能使用weakSelf
    MotionBall * __weak weakSelf = self;
    
}

@end
