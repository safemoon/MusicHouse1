//
//  MainViewController.m
//  MusicHouse
//
//  Created by 李冬 on 16/4/1.
//  Copyright © 2016年 Tim Lee. All rights reserved.
//
//@property(weak,nonatomic) MyViewController *myVC;
//@property(weak,nonatomic) DiscoverViewController *discoverVC;
//@property(weak,nonatomic) MusicLibraryViewController *musicVC;

#import "MainViewController.h"
#import "MyViewController.h"
#import "DiscoverViewController.h"
#import "MusicLibraryViewController.h"
//#import "HomeTopViewController.h" //加入hometopVC

@interface MainViewController ()<UIScrollViewDelegate>




@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configScrollView];
    [self configHomeTopVC];
}


//配置滚动视图
-(void)configScrollView
{
    int w =[UIScreen mainScreen].bounds.size.width;
    int h = [UIScreen mainScreen].bounds.size.height;
    //1.创建滚动视图
    UIScrollView *sv = [[UIScrollView alloc]init];
    
    //设置滚动视图的代理为当前控制器
    //这样，当滚动视图与用户交互时，控制器可以提供响应
    sv.delegate = self;
    
    //2.设置滚动视图
    //读取视图的大小使用bounds，其中x和y初始都是0
    //w和h也就是size，和frame中的size相等
    sv.frame = self.view.bounds;
    
    sv.contentSize = CGSizeMake(3*sv.bounds.size.width, sv.bounds.size.height);
    
    //添加3个图片子视图
    MyViewController *myVC = [[MyViewController alloc]init];
    MusicLibraryViewController *musicVC = [[MusicLibraryViewController alloc]init];
    DiscoverViewController *discoverVC = [[DiscoverViewController alloc]init];
    
    [sv addSubview:myVC.view];
    [sv addSubview:musicVC.view];
    [sv addSubview:discoverVC.view];
    
    myVC.view.frame = CGRectMake(0, 0, w, h);
    musicVC.view.frame = CGRectMake(w, 0, w, h);
    discoverVC.view.frame = CGRectMake(2*w, 0, w, h);

    //3.添加滚动视图到控制器的view中
    [self.view addSubview:sv];
    
    //滚动视图的其他设置
    //到达边缘不弹跳
    sv.bounces = NO;
    //整页滚动
    sv.pagingEnabled = YES;
    //设置不显示水平滚动提示条
    sv.showsHorizontalScrollIndicator = NO;
    
    sv.backgroundColor = [UIColor yellowColor];

}

-(void)configHomeTopVC {
//    HomeTopViewController *homeTopVC = [[HomeTopViewController alloc]init];
//    [self.view addSubview:homeTopVC.view];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
