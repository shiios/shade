//
//  ViewController.m
//  shade
//
//  Created by kalian on 16/3/21.
//  Copyright © 2016年 kalian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *sghTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置代理
    [self.sghTableView setDelegate:self];
    [self.sghTableView setDataSource:self];
    
    self.sghTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.sghTableView.backgroundColor = kColor(238, 238, 238, 1);
    
    [self.sghTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    UIView* coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kNavHeight)];
    
    coverView.backgroundColor = kColor(53, 174, 243, 1);
    
    self.coverView = coverView;
    
    [self.view addSubview:coverView];
    
    //添加navView
    UIView* navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kNavHeight)];
    
    navView.backgroundColor = [UIColor clearColor];
    
    self.navView = navView;
    
    [self.view addSubview:navView];
    
    //标题
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kButtonWidth, kStatusBarHeight, [UIScreen mainScreen].bounds.size.width - 2 * kButtonWidth, kButtonWidth)];
    titleLabel.text = @"天上人间";
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.font = [UIFont systemFontOfSize:19];
    
    titleLabel.textColor = [UIColor whiteColor];
    
    self.titleLabel = titleLabel;
    
    [self.coverView addSubview:titleLabel];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 20;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = @"美味食堂";
    
    return cell;
    
}


#pragma mark - 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - 在此方法中做隐藏导航栏的操作
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //  隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - 注销观察对象
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.sghTableView removeObserver:self forKeyPath:@"contentOffset"];
}

#pragma mark - KVO动态监测滚动
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    SGHLog(@"%@",change);
    NSString * changeString = [NSString stringWithFormat:@"%@",change[@"new"]];
    
    SGHLog(@"%@",changeString);
    changeString = [changeString stringByReplacingOccurrencesOfString:@"NSPoint: {0, " withString:@""];
    changeString = [changeString stringByReplacingOccurrencesOfString:@"}" withString:@""];
    SGHLog(@"%@",changeString);
    CGFloat y = changeString.floatValue;
    SGHLog(@"%f",y);
    self.coverView.alpha = y / ((498.046875 * 0.5) - kNavHeight);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
