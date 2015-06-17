//
//  ViewController.m
//  PyhisicalAnimationStudy
//
//  Created by 思来氏 on 15/6/16.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import "ViewController.h"

#import "DrawGraphics.h"

@interface ViewController ()
{
    UICollisionBehavior *collisionBehivior;
    DrawGraphics *drawGraphics;
}
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
//    UIGravityBehavior *gravityBehivior = [[UIGravityBehavior alloc] initWithItems:@[self.imageView]];
//    [animator addBehavior:gravityBehivior];
    
    
    
    CGRect ballViewFrame = CGRectMake(0,0, 10, 10);
    _motionBallView = [[MotionBall alloc] initWithFrame:ballViewFrame];
//    [self.view addSubview:_motionBallView];
    _motionBallView.delegate = self;
    
    _contentLabel = [[UILabel alloc] initWithFrame:ballViewFrame];
    _contentLabel.layer.cornerRadius = 5;
    _contentLabel.backgroundColor = [UIColor orangeColor];
    [_motionBallView addSubview:_contentLabel];
    
    drawGraphics = [[DrawGraphics alloc] initWithFrame:self.view.frame];
    [drawGraphics addSubview:_motionBallView];
    [self.view addSubview:drawGraphics];
    
    
    collisionBehivior = [[UICollisionBehavior alloc] initWithItems:@[self.contentLabel]];
    collisionBehivior.translatesReferenceBoundsIntoBoundary = YES;
//    [collisionBehivior setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(180, 0, 200, 0)];
    [collisionBehivior addBoundaryWithIdentifier:@"idne" fromPoint:CGPointMake(80, 80) toPoint:CGPointMake(100, 80)];
//    [collisionBehivior addBoundaryWithIdentifier:nil forPath:drawGraphics.path];
//    self.square1PropertiesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.contentLabel]];
//    self.square1PropertiesBehavior.elasticity = 0.5;
//    [animator addBehavior:self.square1PropertiesBehavior];
    
    [animator addBehavior:collisionBehivior];
    self.dynamicAnimator = animator;
    [_motionBallView startUpdateMotion];
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - MotionBallDelegate
-(void)updateMoveDataWithMoveX:(double)accelerometerX andMoveY:(double)accelerometerY{
//    NSLog(@"the x is %.5f and Y is %.5f",accelerometerX,accelerometerY);
}

- (void)ballMoveToPointX:(float)pointX andPointY:(float)pointY{
//    NSLog(@"the point X is %.2f and Y is %.2f",pointX,pointY);
    NSInteger X = pointX;
    NSInteger Y = pointY;
//    NSLog(@"&&&&&&&&&&&&&&&& X is %d and Y is %d",X,Y);
    if ([drawGraphics.path containsPoint:CGPointMake(pointX , pointY)]) {
//        [[[UIAlertView alloc] initWithTitle:@"提示"
//                                    message:@"YES"
//                                   delegate:nil
//                          cancelButtonTitle:nil
//                          otherButtonTitles:@"OK", nil] show];
        NSLog(@"&&&&&&&&&&&&&&&& X is %d and Y is %d",X,Y);
    }
    
}
@end
