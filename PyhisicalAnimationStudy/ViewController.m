//
//  ViewController.m
//  PyhisicalAnimationStudy
//
//  Created by 思来氏 on 15/6/16.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIDynamicAnimator *dynamicAnimator;
@property (nonatomic, strong) UIDynamicItemBehavior *square1PropertiesBehavior;
@end


@implementation ViewController

@synthesize motionBallView = _motionBallView;
@synthesize contentLabel = _contentLabel;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehivior = [[UIGravityBehavior alloc] initWithItems:@[self.imageView]];
//    [animator addBehavior:gravityBehivior];
    
    
    
    
    
    
    CGRect ballViewFrame = CGRectMake(0,0, 40, 40);
    _motionBallView = [[MotionBall alloc] initWithFrame:ballViewFrame];
    [self.view addSubview:_motionBallView];
    _motionBallView.delegate = self;
    
    _contentLabel = [[UILabel alloc] initWithFrame:ballViewFrame];
    _contentLabel.layer.cornerRadius = 20;
    _contentLabel.backgroundColor = [UIColor orangeColor];
    [_motionBallView addSubview:_contentLabel];
    
    
    
    
    UICollisionBehavior *collisionBehivior = [[UICollisionBehavior alloc] initWithItems:@[self.contentLabel]];
    [collisionBehivior setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(0, 0, 480, 320)];
    self.square1PropertiesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.contentLabel]];
    self.square1PropertiesBehavior.elasticity = 0.5;
//    [animator addBehavior:self.square1PropertiesBehavior];
//    [animator addBehavior:collisionBehivior];
    self.dynamicAnimator = animator;
    [_motionBallView startUpdateMotion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - MotionBallDelegate
-(void)updateMoveDataWithMoveX:(double)accelerometerX andMoveY:(double)accelerometerY{
    NSLog(@"the x is %.5f and Y is %.5f",accelerometerX,accelerometerY);
}
@end
