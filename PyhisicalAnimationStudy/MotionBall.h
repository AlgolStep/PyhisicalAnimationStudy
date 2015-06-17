//
//  MotionBall.h
//  PyhisicalAnimationStudy
//
//  Created by 思来氏 on 15/6/16.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@protocol MotionBallDelegate <NSObject>

- (void)updateMoveDataWithMoveX:(double)accelerometerX
                       andMoveY:(double)accelerometerY;

- (void)ballMoveToPointX:(float)pointX andPointY:(float)pointY;
@end
@interface MotionBall : UIView
@property (weak, nonatomic) id<MotionBallDelegate> delegate;

//运动管理器
@property (strong, nonatomic) CMMotionManager *cmMotionManager;

/**
 *  开始移动
 */
- (void)startUpdateMotion;
/**
 *  停止移动
 */
- (void)stopMotion;
@end
