//
//  DrawGraphics.m
//  PyhisicalAnimationStudy
//
//  Created by 思来氏 on 15/6/17.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import "DrawGraphics.h"

@interface DrawGraphics ()

@end

@implementation DrawGraphics

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawLeftLineWithStartPoint:CGPointMake(80.0, self.frame.size.height-50.0)
                         andEndPoint:CGPointMake(80.0, 80.0)
                        useQuadPoint:CGPointMake(80.0, 80.0)];
    
    [self drawRightLineWithStartPoint:CGPointMake(100, self.frame.size.height-50)
                          andEndPoint:CGPointMake(100, 80)
                         useQuadPoint:CGPointMake(100, 80)];
}


/**
 *  左线
 */
- (void)drawLeftLineWithStartPoint:(CGPoint)startPoint
                       andEndPoint:(CGPoint)endPoint
                      useQuadPoint:(CGPoint)quadPoint{
    self.path = [[UIBezierPath alloc] init];
    
//    设置起始点
    [self.path moveToPoint:startPoint];
    [self.path addLineToPoint:endPoint];
    [[UIColor orangeColor] setStroke];
    [self.path setLineWidth:3.0f];
    [self.path stroke];
    NSLog(@"the bezierpath bounds is %@",NSStringFromCGRect(self.path.bounds));
    //   获取当前绘图环境
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //    设置画笔的宽度
    CGContextSetLineWidth(ctx, 1);
    //    设置画笔的颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    CGContextAddQuadCurveToPoint(ctx, quadPoint.x, quadPoint.y, endPoint.x, endPoint.y);
    
//    CGContextStrokePath(ctx);
}

/**
 *  右线
 */
- (void)drawRightLineWithStartPoint:(CGPoint)startPoint
                       andEndPoint:(CGPoint)endPoint
                      useQuadPoint:(CGPoint)quadPoint{
    //   获取当前绘图环境
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //    设置画笔的宽度
    CGContextSetLineWidth(ctx, 1);
    //    设置画笔的颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    CGContextAddQuadCurveToPoint(ctx, quadPoint.x, quadPoint.y, endPoint.x, endPoint.y);
    
    CGContextStrokePath(ctx);
}

@end
