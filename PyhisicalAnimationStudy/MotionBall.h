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

@end
@interface MotionBall : UIView
@property (weak, nonatomic) id<MotionBallDelegate> delegate;

//运动管理器
@property (strong, nonatomic) CMMotionManager *cmMotionManager;


@end
