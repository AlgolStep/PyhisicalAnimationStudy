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
        self.velocity = 50.0;
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
    
/* 判断设备加速度传感器是否可用，如果可用则继续 */
    if ([self.cmMotionManager isAccelerometerAvailable]) {
        /*给采样频率赋值，单位是秒*/
        [self.cmMotionManager setAccelerometerUpdateInterval:updateInterval];
        /* 加速度传感器开始采样，每次采样结果在block中处理 */
        [self.cmMotionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            fframe.origin.x += (accelerometerData.acceleration.x * weakSelf.velocity) * 1;
            fframe.origin.y += (accelerometerData.acceleration.y * weakSelf.velocity) * -1;
        
            if(fframe.origin.x < 0)
                fframe.origin.x = 0;
            if(fframe.origin.y < 0)
                fframe.origin.y = 0;
            
            if(fframe.origin.x > (size.width - fframe.size.width))
                fframe.origin.x = (size.width - fframe.size.width);
            if(fframe.origin.y > (size.height - fframe.size.height))
                fframe.origin.y = (size.height - fframe.size.height);
            
            /* 运动动画 */
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.1];
            [weakSelf setFrame:fframe];
            [UIView commitAnimations];
            [weakSelf.delegate updateMoveDataWithMoveX:accelerometerData.acceleration.x andMoveY:accelerometerData.acceleration.y];
        }];
    }
}


/**
 *  停止移动
 */
- (void)stopMotion{
    if ([self.cmMotionManager isAccelerometerAvailable]) {
        [self.cmMotionManager stopAccelerometerUpdates];
    }
}

@end
