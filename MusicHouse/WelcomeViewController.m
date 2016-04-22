//
//  WelcomeViewController.m
//  Demo3_欢迎界面
//
//  Created by tarena on 15/12/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WelcomeViewController.h"
#import "MainViewController.h"

@interface WelcomeViewController ()<UIScrollViewDelegate>

@property(nonatomic,weak)UIPageControl *pc;  //自己：思路要什么给什么，要pegeController，实例化一个对象给他

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configScrollView];
    [self configPageControl];
}
//配置小圆点
-(void)configPageControl
{
    //1.创建pageControl
    UIPageControl *pc = [[UIPageControl alloc]init];
    self.pc = pc;
    
    //2.常规设置
    pc.frame = CGRectMake(0, self.view.bounds.size.height-60, self.view.bounds.size.width, 40);
    
    pc.numberOfPages = 4;
    pc.pageIndicatorTintColor = [UIColor redColor];
    pc.currentPageIndicatorTintColor = [UIColor blackColor];
    //关闭与用户的交互
    pc.userInteractionEnabled = NO;
    
    //3.添加到视图中
    [self.view addSubview:pc];
}


//配置滚动视图
-(void)configScrollView
{
    //1.创建滚动视图
    UIScrollView *sv = [[UIScrollView alloc]init];
    
    //设置滚动视图的代理为当前控制器
    //这样，当滚动视图与用户交互时，控制器可以提供响应
    sv.delegate = self;
    
    //2.设置滚动视图
    //读取视图的大小使用bounds，其中x和y初始都是0
    //w和h也就是size，和frame中的size相等
    sv.frame = self.view.bounds;
    
    sv.contentSize = CGSizeMake(4*sv.bounds.size.width, sv.bounds.size.height);
    
    //添加4个图片子视图
    for (NSInteger i=0; i<4; i++)
    {
        UIImageView *iv = [[UIImageView alloc]init];
        iv.frame = CGRectMake(i*sv.bounds.size.width, 0, sv.bounds.size.width, sv.bounds.size.height);
        NSString *imageName = [NSString stringWithFormat:@"welcome%ld",i+1];
        iv.image = [UIImage imageNamed:imageName];
        [sv addSubview:iv];
        
        //判断如果是第四个图片，则向其中添加一个按钮
        if (i==3)
        {
            [self configEnterButton:iv];
        }
    }
    
    //3.添加滚动视图到控制器的view中
    [self.view addSubview:sv];
    
    //滚动视图的其他设置
    //到达边缘不弹跳
    sv.bounces = NO;
    //整页滚动
    sv.pagingEnabled = YES;
    //设置不显示水平滚动提示条
    sv.showsHorizontalScrollIndicator = NO;
}

//配置进入应用的按钮
-(void)configEnterButton:(UIImageView *)iv
{
    //开启图片视图的用户交互功能
    iv.userInteractionEnabled = YES;
    
    UIButton *enterButton = [[UIButton alloc]init];
    
    enterButton.frame = CGRectMake(iv.bounds.size.width*0.5-50, iv.bounds.size.height*0.6, 100, 30);
    enterButton.backgroundColor = [UIColor orangeColor];
    [enterButton setTitle:@"立即进入" forState:UIControlStateNormal];
    [enterButton addTarget:self action:@selector(enterApp:) forControlEvents:UIControlEventTouchUpInside];
    [iv addSubview:enterButton];
}

//点击进入app
-(void)enterApp:(UIButton *)sender
{
    MainViewController *mainVC = [[MainViewController alloc]init];
    
    //获取应用程序对象
    UIApplication *app = [UIApplication sharedApplication];
    app.keyWindow.rootViewController = mainVC;
}


#pragma mark - UIScrollViewDelegate协议

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    
    //四舍五入偏移量除以滚动视图的一屏宽
    self.pc.currentPage = round(offset.x/scrollView.bounds.size.width);
    
}




@end
