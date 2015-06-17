//
//  ViewController.h
//  PyhisicalAnimationStudy
//
//  Created by 思来氏 on 15/6/16.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MotionBall.h"
@interface ViewController : UIViewController<MotionBallDelegate>

@property (strong, nonatomic) MotionBall *motionBallView;
@property (strong, nonatomic) UILabel *contentLabel;
@end

