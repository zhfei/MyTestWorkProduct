//
//  DrawRectView2.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/6/24.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "DrawRectView2.h"

static CGFloat const kRow1Y = 10;
static CGFloat const kRow2Y = 100;
static CGFloat const kRow3Y = 180;
static CGFloat const kRow4Y = 280;



@implementation DrawRectView2

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context =UIGraphicsGetCurrentContext();
    //1.画线
    CGPoint aPoints[3];//坐标点
    aPoints[0] =CGPointMake(10,kRow1Y);//坐标1
    aPoints[1] =CGPointMake(50,kRow1Y);//坐标2
    aPoints[2] =CGPointMake(50,80);//坐标3
    CGContextAddLines(context, aPoints,3);//添加线
    CGContextDrawPath(context,kCGPathStroke);//根据坐标绘制路径
    
    //2.弧线
    //(方法一)
    //从(140,80)到(148,68)画一条直线,从(148,68)到(156,80)画一条直线,两条线之间画一条10度的曲线
    CGContextSetRGBStrokeColor(context,89/255.0,89/255.0,89/255.0,1);//改变画笔颜色
    CGContextMoveToPoint(context,70,kRow1Y);//开始坐标p1
    CGContextAddArcToPoint(context,80,kRow1Y,90,kRow1Y+10,10);
    CGContextStrokePath(context);//绘画路径
    
    //(方法二)
    //以(200,100)为圆心,30为半径,逆时针画60度弧线(1为顺时针,0为逆时针)
    CGContextAddArc(context,120,30,30,0,M_PI/3,1);
    CGContextStrokePath(context);//绘画路径
    

    //3.简单矩形
    CGContextStrokeRect(context,CGRectMake(160,kRow1Y,10,10));//画方框
    CGContextFillRect(context,CGRectMake(175,kRow1Y,10,10));//填充框

    //4.画矩形(填充颜色)
    UIColor*aColor = [UIColor colorWithRed:1 green:0.0 blue:0 alpha:1];
    CGContextSetLineWidth(context,2.0);//线的宽度
    aColor = [UIColor blueColor];//blue蓝色
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    aColor = [UIColor yellowColor];
    CGContextSetStrokeColorWithColor(context, aColor.CGColor);//线框颜色
    CGContextAddRect(context,CGRectMake(200,kRow1Y,60,30));//画方框
    CGContextDrawPath(context,kCGPathFillStroke);//绘画路径
    
    //5.矩形(填充渐变颜色)
    //方式一:
    CAGradientLayer*gradient1 = [CAGradientLayer layer];
    gradient1.frame=CGRectMake(10,kRow2Y,60,30);
    gradient1.colors= [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor,
                       (id)[UIColor grayColor].CGColor,
                       (id)[UIColor blackColor].CGColor,
                       (id)[UIColor yellowColor].CGColor,
                       (id)[UIColor blueColor].CGColor,
                       (id)[UIColor redColor].CGColor,
                       (id)[UIColor greenColor].CGColor,
                       (id)[UIColor orangeColor].CGColor,
                       (id)[UIColor brownColor].CGColor,nil];
    [self.layer insertSublayer:gradient1 atIndex:0];
    
    //方式二:
    CGColorSpaceRef rgb =CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        1,1,1,1.00,
        1,1,0,1.00,
        1,0,0,1.00,
        1,0,1,1.00,
        0,1,1,1.00,
        0,1,0,1.00,
        0,0,1,1.00,
        0,0,0,1.00,
    };
    CGGradientRef gradient =CGGradientCreateWithColorComponents(rgb, colors,NULL,sizeof(colors)/(sizeof(colors[0])*4));//形成梯形，渐变的效果
    CGColorSpaceRelease(rgb);
    
    //画线形成一个矩形
    //CGContextSaveGState与CGContextRestoreGState的作用
    /*
     CGContextSaveGState函数的作用是将当前图形状态推入堆栈。之后，您对图形状态所做的修改会影响随后的描画操作，但不影响存储在堆栈中的拷贝。在修改完成后，您可以通过CGContextRestoreGState函数把堆栈顶部的状态弹出，返回到之前的图形状态。这种推入和弹出的方式是回到之前图形状态的快速方法，避免逐个撤消所有的状态修改；这也是将某些状态（比如裁剪路径）恢复到原有设置的唯一方式。
     */
    CGContextSaveGState(context);
    CGContextMoveToPoint(context,100,kRow2Y);
    CGContextAddLineToPoint(context,160,kRow2Y);
    CGContextAddLineToPoint(context,160,kRow2Y+20);
    CGContextAddLineToPoint(context,100,kRow2Y+20);
    CGContextClip(context);//context裁剪路径,后续操作的路径
    //CGContextDrawLinearGradient(CGContextRef context,CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint,CGGradientDrawingOptions options)
    //gradient渐变颜色,startPoint开始渐变的起始位置,endPoint结束坐标,options开始坐标之前or开始之后开始渐变
    CGContextDrawLinearGradient(context, gradient,CGPointMake(100,kRow2Y) ,CGPointMake(160,kRow2Y+20),kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);//恢复到之前的context
    
    //再写一个看看效果
    CGContextSaveGState(context);
    CGContextMoveToPoint(context,180,kRow2Y);
    CGContextAddLineToPoint(context,230,kRow2Y);
    CGContextAddLineToPoint(context,230,kRow2Y+20);
    CGContextAddLineToPoint(context,180,kRow2Y+20);
    CGContextClip(context);//裁剪路径
    //说白了，开始坐标和结束坐标是控制渐变的方向和形状
    CGContextDrawLinearGradient(context, gradient,CGPointMake(180,kRow2Y) ,CGPointMake(230,kRow2Y+20),kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);//恢复到之前的context
    

    //6.颜色渐变的圆
    [@"颜色渐变的圆:" drawInRect:CGRectMake(10,kRow3Y,150,50)withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor redColor]}];
    CGContextDrawRadialGradient(context, gradient,CGPointMake(180,kRow3Y),0.0,CGPointMake(180,kRow3Y),10,kCGGradientDrawsBeforeStartLocation);
    
    //7.画椭圆
    CGContextAddEllipseInRect(context,CGRectMake(210,kRow3Y,20,8));//椭圆
    CGContextDrawPath(context,kCGPathFillStroke);
    
    //8.画三角形
    //只要三个点就行跟画一条线方式一样，把三点连接起来
    CGPoint sPoints[3];//坐标点
    sPoints[0] =CGPointMake(230,kRow3Y+50);//坐标1
    sPoints[1] =CGPointMake(260,kRow3Y+50);//坐标2
    sPoints[2] =CGPointMake(260,kRow3Y);//坐标3
    CGContextAddLines(context, sPoints,3);//添加线
    CGContextClosePath(context);//封起来
    CGContextDrawPath(context,kCGPathFillStroke);//根据坐标绘制路径
    
    //9.画圆角矩形
    float fw =180;
    float fh =280;
    CGContextMoveToPoint(context, fw, fh-20);//开始坐标右边开始
    CGContextAddArcToPoint(context, fw, fh, fw-20, fh,10);//右下角角度
    CGContextAddArcToPoint(context,120, fh,120, fh-20,10);//左下角角度
    CGContextAddArcToPoint(context,120,250, fw-20,250,10);//左上角
    CGContextAddArcToPoint(context, fw,250, fw, fh-20,10);//右上角
    CGContextClosePath(context);
    CGContextDrawPath(context,kCGPathFillStroke);//根据坐标绘制路径
    
    //10.画贝塞尔曲线
    //二次曲线
    CGContextMoveToPoint(context,10,kRow4Y);//设置Path的起点
    CGContextAddQuadCurveToPoint(context,50,kRow4Y+50,60,kRow4Y+20);//设置贝塞尔曲线的控制点坐标和终点坐标
    CGContextStrokePath(context);
    
    //三次曲线函数
    CGContextMoveToPoint(context,40,kRow4Y);//设置Path的起点
    CGContextAddCurveToPoint(context,50,220,80,300,100,350);//设置贝塞尔曲线的控制点坐标和控制点坐标终点坐标
    CGContextStrokePath(context);
    

    //11.图片
    UIImage*image = [UIImage imageNamed:@"photo_"];
    [image drawInRect:CGRectMake(160,kRow4Y,40,40)];//在坐标中画出图片
    //[image drawAtPoint:CGPointMake(100, 340)];//保持图片大小在point点开始画图片，可以把注释去掉看看
    CGContextDrawImage(context,CGRectMake(200,kRow4Y,20,20), image.CGImage);
    //使用这个使图片上下颠倒了，参考http://blog.csdn.net/koupoo/article/details/8670024
//    CGContextDrawTiledImage(context, CGRectMake(0, 0, 20, 20), image.CGImage);//平铺图
    
//    CG_EXTERN void CGContextDrawPath(CGContextRef cg_nullable c, CGPathDrawingMode mode)
//    CG_EXTERN void CGContextDrawImage(CGContextRef cg_nullable c, CGRect rect,CGImageRef cg_nullable image)
//    CG_EXTERN void CGContextDrawTiledImage(CGContextRef cg_nullable c, CGRect rect,CGImageRef cg_nullable image)
//    CG_EXTERN void CGContextDrawLinearGradient(CGContextRef cg_nullable c,CGGradientRef cg_nullable gradient, CGPoint startPoint, CGPoint endPoint,
//                                               CGGradientDrawingOptions options)
//    CG_EXTERN void CGContextDrawRadialGradient(CGContextRef cg_nullable c,CGGradientRef cg_nullable gradient, CGPoint startCenter, CGFloat startRadius,
//                                               CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
//    
//    CG_EXTERN void CGContextDrawShading(CGContextRef cg_nullable c,cg_nullable CGShadingRef shading)
//    CG_EXTERN void CGContextDrawPDFPage(CGContextRef cg_nullable c,CGPDFPageRef cg_nullable page)
//    CG_EXTERN void CGContextDrawPDFDocument(CGContextRef cg_nullable c, CGRect rect,CGPDFDocumentRef cg_nullable document, int page)
    
}

@end
