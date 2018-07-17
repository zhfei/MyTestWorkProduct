//
//  PageScrollView.m
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/7/17.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "PageScrollView.h"

static CGFloat WIDTH = 200;
static CGFloat kHeigh = 200;
const CGFloat kPageControllHeigh = 20;

static CGFloat scrollViewLeftM = 20;
static CGFloat imageViewLeftM = 10;



@interface PageScrollView ()
{
    UIScrollView *_myScrollView;
    UIImageView *_myImageView;
    UIPageControl *_pageControl;
}
@end

@implementation PageScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        WIDTH = self.width;
        kHeigh = self.bounds.size.height-kPageControllHeigh;
        self.dataArr = @[@"1",@"2",@"3"].mutableCopy;
        //添加ScrollView
        [self addScrollView];
        //添加图片控件
        [self addImageView];
         [self addPageControll];
    }
    return self;
}

#pragma mark---添加ScrollView
-(void)addScrollView
{
    //scrollView默认的分页大小是scrollView的width
    CGFloat width = self.bounds.size.width - scrollViewLeftM*2;
    
    _myScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(scrollViewLeftM, 0, width, kHeigh)];
    _myScrollView.pagingEnabled=YES;
    _myScrollView.clipsToBounds=NO;
    _myScrollView.bounces=NO;
    _myScrollView.showsHorizontalScrollIndicator=NO;
    _myScrollView.contentSize=CGSizeMake((width+imageViewLeftM)*self.dataArr.count + imageViewLeftM, kHeigh);
    _myScrollView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_myScrollView];
}

#pragma mark---添加图片控件
/**  说明
 *   1. 设置完 ScrollView的width, 那么分页的宽也为 width.
 *   2. 图片宽为a 间距为 gap, 那么 图片应该在ScrollView上居中, 距离ScrollView左右间距为halfGap.
 *   与 ScrollView的width关系为 width = halfGap + a + halfGap.
 *   3. distance : Scroll距离 底层视图View两侧距离.
 *   假设 要露出上下页内容大小为 m ,   distance = m + halfGap
 *
 *  图片位置对应关系 :
 *  0 ->  1 * halfGap ;
 *  1 ->  3 * halfGap + a ;
 *  2 ->  5 * halfGap + 2 * a ;
 .
 .
 *  i   -> (2 * i +1) *  halfGap + i *(width - 2 * halfGap )
 */

-(void)addImageView
{
    CGFloat imageViewWidth = self.bounds.size.width - scrollViewLeftM*2 - imageViewLeftM*2;
    
    CGFloat scrollWidth = self.bounds.size.width - scrollViewLeftM*2;
    
    for (NSInteger i=0; i<self.dataArr.count; i++) {
        _myImageView=[[UIImageView alloc] init];
        
        _myImageView.frame = CGRectMake((2 * i + 1) * imageViewLeftM + i * imageViewWidth, 0, imageViewWidth, kHeigh);
        _myImageView.image=[UIImage imageNamed:self.dataArr[i]];
        switch (i) {
            case 0:
            {
                _myImageView.backgroundColor = [UIColor blueColor];
            }
                break;
            case 1:
            {
                _myImageView.backgroundColor = [UIColor yellowColor];
            }
                break;
            case 2:
            {
                _myImageView.backgroundColor = [UIColor brownColor];
            }
                break;
                
            default:
                break;
        }
        [_myScrollView addSubview:_myImageView];
    }
}

-(void)addPageControll {

    UIPageControl *pageControl = [UIPageControl new];
    
    pageControl.frame = CGRectMake((WIDTH-100)*0.5, kHeigh, 100, kPageControllHeigh);
    //自定义圆点样式
    [pageControl setValue:[UIImage imageNamed:@"star_gray"] forKeyPath:@"pageImage"];
    [pageControl setValue:[UIImage imageNamed:@"star_red"] forKeyPath:@"currentPageImage"];
    //修改圆点间距离
    pageControl.transform= CGAffineTransformScale(CGAffineTransformIdentity , 0.2, 0.2);//pageControl.transform.scaledBy(x: 0.65, y: 1)
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    _pageControl = pageControl;
    [self addSubview:pageControl];
}

#pragma mark---修改hitTest方法
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isEqual:self]){
        for (UIView *subview in _myScrollView.subviews){
            CGPoint offset = CGPointMake(point.x - _myScrollView.frame.origin.x + _myScrollView.contentOffset.x - subview.frame.origin.x, point.y - _myScrollView.frame.origin.y + _myScrollView.contentOffset.y - subview.frame.origin.y);
            
            if ((view = [subview hitTest:offset withEvent:event])){
                return view;
            }
        }
        return _myScrollView;
    }
    return view;
}



@end
