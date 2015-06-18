//
//  ViewController.m
//  PyhisicalAnimationStudy
//
//  Created by 思来氏 on 15/6/16.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

#import "DrawGraphics.h"

@interface ViewController ()
{
    UICollisionBehavior *collisionBehivior;
    DrawGraphics *drawGraphics;
    AVAudioPlayer *player;
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
    
//    UIGravityBehavior *gravityBehivior = [[UIGravityBehavior alloc] initWithItems:@[self.imageView]];
//    [animator addBehavior:gravityBehivior];
#pragma mark -初始化音乐
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"答错" withExtension:@"mp3"];
    NSError* error = nil;
    if(nil!=error)
    {
        
    }
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];

    
    
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
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:drawGraphics];
    collisionBehivior = [[UICollisionBehavior alloc] initWithItems:@[self.contentLabel]];
    collisionBehivior.translatesReferenceBoundsIntoBoundary = YES;
    [collisionBehivior setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(10, 10, 200, 200)];
//    [collisionBehivior addBoundaryWithIdentifier:@"idne" fromPoint:CGPointMake(80, 80) toPoint:CGPointMake(100, 80)];
//    [collisionBehivior addBoundaryWithIdentifier:nil forPath:drawGraphics.path];
//    self.square1PropertiesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.contentLabel]];
//    self.square1PropertiesBehavior.elasticity = 0.5;
//    [animator addBehavior:self.square1PropertiesBehavior];
    
//    [animator addBehavior:collisionBehivior];
    self.dynamicAnimator = animator;
    [_motionBallView startUpdateMotion];
    
    
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 40, 30)];
    [startButton setTitle:@"start" forState:UIControlStateNormal];
    [startButton addTarget:self
                    action:@selector(startMove)
          forControlEvents:UIControlEventTouchUpInside];
    [drawGraphics addSubview:startButton];
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
    CGRect ballRect = CGRectMake(X, Y, 12, 12);
    CGRect pathRect = CGRectMake(drawGraphics.path.bounds.origin.x, drawGraphics.path.bounds.origin.y, 2, drawGraphics.path.bounds.size.height);
    if (CGRectIntersectsRect(ballRect,pathRect)) {
        NSLog(@"********** X is %d and Y is %d",X,Y);
        [_motionBallView stopMotion];
        [player play];
        
    }
    
}

- (void)startMove
{
    [_motionBallView startUpdateMotion];
}
@end
