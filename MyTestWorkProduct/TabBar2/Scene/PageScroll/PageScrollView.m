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

static NSInteger imageViewCount = 3;

@interface PageScrollView ()<UIScrollViewDelegate>
{
    UIScrollView *_myScrollView;
    UIImageView *_myImageView;
    UIPageControl *_pageControl;
    NSTimer *_rotateTimer;
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
         _rotateTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeView) userInfo:nil repeats:YES];
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
-(void)addImageView {
    CGFloat imageViewWidth = self.bounds.size.width - scrollViewLeftM*2 - imageViewLeftM*2;
    
    CGFloat scrollWidth = self.bounds.size.width - scrollViewLeftM*2;
    
    for (NSInteger i=0; i<imageViewCount; i++) {
        _myImageView=[[UIImageView alloc] init];
        
        _myImageView.frame = CGRectMake((2 * i + 1) * imageViewLeftM + i * imageViewWidth, 0, imageViewWidth, kHeigh);
        _myImageView.image=[UIImage imageNamed:self.dataArr[i]];
        _myImageView.tag = 1000+i;
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
        NSLog(@"%@---%d",NSStringFromCGRect(_myImageView.frame),i);
        [_myScrollView addSubview:_myImageView];
    }
    _myScrollView.tag = 1100;

    UIImageView *iv = [_myScrollView viewWithTag:1000];
    CGRect frame = iv.frame;
    frame.origin.x = imageViewCount*_myScrollView.bounds.size.width + imageViewLeftM;
    
    UIImageView *iv0 = UIImageView.new;
    iv0.frame = frame;
    iv0.backgroundColor = iv.backgroundColor;
    [_myScrollView addSubview:iv0];
    
    UIImageView *iv1 = [_myScrollView viewWithTag:1001];
    CGRect frame1 = iv1.frame;
    frame1.origin.x = (imageViewCount + 1)*_myScrollView.bounds.size.width + imageViewLeftM;
    
    UIImageView *iv2 = UIImageView.new;
    iv2.frame = frame1;
    iv2.backgroundColor = iv1.backgroundColor;
    [_myScrollView addSubview:iv2];
    
    _myScrollView.delegate = self;
}

-(void)addPageControll {
    UIPageControl *pageControl = [UIPageControl new];
    
    pageControl.frame = CGRectMake((WIDTH-100)*0.5, kHeigh, 100, kPageControllHeigh);
    pageControl.pageIndicatorTintColor = [UIColor blueColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
//    //自定义圆点样式
//    [pageControl setValue:[UIImage imageNamed:@"star_gray"] forKeyPath:@"pageImage"];
//    [pageControl setValue:[UIImage imageNamed:@"star_red"] forKeyPath:@"currentPageImage"];
//    //修改圆点间距离
//    pageControl.transform= CGAffineTransformScale(CGAffineTransformIdentity , 0.2, 0.2);//pageControl.transform.scaledBy(x: 0.65, y: 1)
    pageControl.numberOfPages = imageViewCount;
    pageControl.currentPage = 0;
    [pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    _pageControl = pageControl;
    [self addSubview:pageControl];
}

- (void)pageChanged:(UIPageControl *)pageControl {
    NSInteger num = pageControl.currentPage;
    CGFloat scrollWidth = self.bounds.size.width - scrollViewLeftM*2;
    CGFloat result = (scrollWidth)*num;
    
    NSLog(@"%f---%d",result,num);
    [_myScrollView setContentOffset:CGPointMake(result, 0) animated:YES];
}

//定时器的回调方法   切换界面
- (void)changeView{
    //得到scrollView
    UIScrollView *scrollView = [self viewWithTag:1100];
    CGFloat scrollWidth = scrollView.bounds.size.width;
    
    //通过改变contentOffset来切换滚动视图的子界面
    float offset_X = scrollView.contentOffset.x;
    //每次切换一个屏幕
    offset_X += scrollWidth;
    
    //说明要从最右边的多余视图开始滚动了，最右边的多余视图实际上就是第一个视图。所以偏移量需要更改为第一个视图的偏移量。
    if (offset_X > CGRectGetWidth(scrollView.bounds)*imageViewCount) {
        scrollView.contentOffset = CGPointMake(0, 0);
    }
    //说明正在显示的就是最右边的多余视图，最右边的多余视图实际上就是第一个视图。所以pageControl的小白点需要在第一个视图的位置。
    if (offset_X == CGRectGetWidth(scrollView.bounds)*imageViewCount) {
        _pageControl.currentPage = 0;
    }else{
        _pageControl.currentPage = offset_X/CGRectGetWidth(scrollView.bounds);
    }
    
    //得到最终的偏移量
    CGPoint resultPoint = CGPointMake(offset_X, 0);
    //切换视图时带动画效果
    //最右边的多余视图实际上就是第一个视图，现在是要从第一个视图向第二个视图偏移，所以偏移量为一个屏幕宽度
    if (offset_X >CGRectGetWidth(scrollView.bounds)*imageViewCount) {
        _pageControl.currentPage = 1;
        [scrollView setContentOffset:CGPointMake(CGRectGetWidth(scrollView.bounds), 0) animated:YES];
    }else{
        [scrollView setContentOffset:resultPoint animated:YES];
    }
    
}

#pragma mark -- 滚动视图的代理方法
//开始拖拽的代理方法，在此方法中暂停定时器。
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"正在拖拽视图，所以需要将自动播放暂停掉");
    //setFireDate：设置定时器在什么时间启动
    //[NSDate distantFuture]:将来的某一时刻
    [_rotateTimer setFireDate:[NSDate distantFuture]];
}

//视图静止时（没有人在拖拽），开启定时器，让自动轮播
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //视图静止之后，过1.5秒在开启定时器
    //[NSDate dateWithTimeInterval:1.5 sinceDate:[NSDate date]]  返回值为从现在时刻开始 再过1.5秒的时刻。
    NSLog(@"开启定时器");
    [_rotateTimer setFireDate:[NSDate dateWithTimeInterval:2 sinceDate:[NSDate date]]];
}

#pragma mark---修改hitTest方法
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
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
