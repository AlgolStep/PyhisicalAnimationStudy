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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehivior = [[UIGravityBehavior alloc] initWithItems:@[self.imageView]];
    [animator addBehavior:gravityBehivior];
    self.dynamicAnimator = animator;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
