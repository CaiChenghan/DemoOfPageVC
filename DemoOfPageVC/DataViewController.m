//
//  DataViewController.m
//  DemoOfPageVC
//
//  Created by 蔡成汉 on 16/8/17.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

/**
 *  标题
 */
@property (nonatomic , strong) UILabel *myLabel;

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _myLabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.bounds.size.width - 100.0)/2.0, 100.0, 100, 30.0)];
    _myLabel.textColor = [UIColor whiteColor];
    _myLabel.textAlignment = NSTextAlignmentCenter;
    _myLabel.backgroundColor = [UIColor purpleColor];
    _myLabel.text = [NSString stringWithFormat:@"第%ld页",(long)_index];
    [self.view addSubview:_myLabel];
}

-(void)setIndex:(NSInteger)index
{
    _index = index;
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
