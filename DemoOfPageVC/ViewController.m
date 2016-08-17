//
//  ViewController.m
//  DemoOfPageVC
//
//  Created by 蔡成汉 on 16/8/17.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "ViewController.h"
#import "DataViewController.h"

@interface ViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>

/**
 *  myPageViewController
 */
@property (nonatomic , strong) UIPageViewController *myPageViewController;

/**
 *  页面数据源
 */
@property (nonatomic , strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataArray = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3", nil];
    
    //初始化myPageViewController
    _myPageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _myPageViewController.dataSource = self;
    
    DataViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:startingViewController];
    [_myPageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:_myPageViewController];
    [self.view addSubview:_myPageViewController.view];
    _myPageViewController.view.frame = self.view.bounds;
    [_myPageViewController didMoveToParentViewController:self];
    self.view.gestureRecognizers = _myPageViewController.gestureRecognizers;
}

/**
 *  获取PageDataVC
 *
 *  @param index index
 *
 *  @return PageDataVC
 */
-(DataViewController *)viewControllerAtIndex:(NSInteger)index
{
    if (self.dataArray.count == 0 || index >= self.dataArray.count)
    {
        return nil;
    }
    DataViewController *viewController = [[DataViewController alloc]init];
    viewController.index = index;
    return viewController;
}

/**
 *  获取PageDataVC的索引值 -- 根据PageDataVC的数据
 *
 *  @param viewController PageDataVC
 *
 *  @return PageDataVC索引值
 */
-(NSUInteger)indexOfViewController:(DataViewController *)viewController
{
//    return [self.dataArray indexOfObject:viewController.index];
    return viewController.index;
}

#pragma mark - UIPageViewControllerDataSource


-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == 0 || index == NSNotFound)
    {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound)
    {
        return nil;
    }
    index++;
    if (index == self.dataArray.count)
    {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
