//
//  ThirdViewController.m
//  CarProduct
//
//  Created by 王硕 on 15/10/16.
//  Copyright © 2015年 王硕. All rights reserved.
//

#import "ThirdViewController.h"
#import "JudgeCell.h"
@interface ThirdViewController (){
    UIScrollView *topScrollView;
}

@end

@implementation ThirdViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initTopView];
    [self initMainView];
}
-(void)initMainView{
    [self.BoomScrollView setContentSize:CGSizeMake(ScreenWidth*3, ScreenHeight-128-44)];
    self.BoomScrollView.pagingEnabled = YES;
    self.BoomScrollView.delegate = self;
    UITableView *tableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, self.BoomScrollView.frame.size.height)];
    tableView1.delegate = self;
    tableView1.dataSource =self;
    [self.BoomScrollView addSubview:tableView1];
    
    UITableView *tableView2 = [[UITableView alloc]initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, self.BoomScrollView.frame.size.height)];
    tableView2.delegate = self;
    tableView2.dataSource =self;
    [self.BoomScrollView addSubview:tableView2];
    
    UITableView *tableView3 = [[UITableView alloc]initWithFrame:CGRectMake(ScreenWidth*2, 0, ScreenWidth, self.BoomScrollView.frame.size.height)];
    tableView3.delegate = self;
    tableView3.dataSource =self;
    [self.BoomScrollView addSubview:tableView3];
}
-(void)initTopView{
    topScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 44)];
    topScrollView.scrollEnabled = NO;
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth/3, 44)];
    bgView.backgroundColor = [UIColor blueColor];
    [topScrollView addSubview:bgView];
    
    [topScrollView setContentSize:CGSizeMake(ScreenWidth*3, 44)];
    [topScrollView scrollRectToVisible:CGRectMake(ScreenWidth, 0, ScreenWidth, 44) animated:NO];
    topScrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:topScrollView];
    UIButton *FirstBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth/3                                                                   , 40)];
    [FirstBtn setTitle:@"全部" forState:UIControlStateNormal];
    [FirstBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    FirstBtn.backgroundColor = [UIColor whiteColor];
    [FirstBtn addTarget:self action:@selector(ClickFirst) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:FirstBtn];
    
    UIButton *SecondBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/3, 64, ScreenWidth/3, 40)];
    [SecondBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [SecondBtn setTitle:@"未消费" forState:UIControlStateNormal];
    SecondBtn.backgroundColor = [UIColor whiteColor];
    [SecondBtn addTarget:self action:@selector(ClickSecond) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:SecondBtn];
    
    UIButton *ThirdBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth*2/3, 64, ScreenWidth/3
                                                                   , 40)];
    [ThirdBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [ThirdBtn setTitle:@"待评价" forState:UIControlStateNormal];
    ThirdBtn.backgroundColor = [UIColor whiteColor];
    [ThirdBtn addTarget:self action:@selector(ClickThird) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:ThirdBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

#pragma mark - 与XIB绑定事件

#pragma mark - 自己的方法
-(void)ClickFirst{
    [topScrollView scrollRectToVisible:CGRectMake(ScreenWidth, 0, ScreenWidth, 44) animated:YES];
    [self.BoomScrollView scrollRectToVisible:CGRectMake(0, 0, ScreenWidth,  ScreenHeight-128-44) animated:YES];
}
-(void)ClickSecond{
    [topScrollView scrollRectToVisible:CGRectMake(ScreenWidth/3*2, 0, ScreenWidth, 44) animated:YES];
    [self.BoomScrollView scrollRectToVisible:CGRectMake(ScreenWidth, 0, ScreenWidth,  ScreenHeight-128-44) animated:YES];

}
-(void)ClickThird{
    [topScrollView scrollRectToVisible:CGRectMake(ScreenWidth/3, 0, ScreenWidth, 44) animated:YES];
    [self.BoomScrollView scrollRectToVisible:CGRectMake(ScreenWidth*2, 0, ScreenWidth,  ScreenHeight-128-44) animated:YES];
}
-(void)ClickJudge{
    NSLog(@"ClickJudge");
    [self performSegueWithIdentifier:@"Judge" sender:self];
}
#pragma mark - 重写或继承base中的方法

#pragma mark - 需要子类继承的

#pragma mark - 消息方法

#pragma mark - 代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int i ;
    if (scrollView.contentOffset.x !=1) {
        i=scrollView.contentOffset.x;
        if (i == 0) {
            [topScrollView scrollRectToVisible:CGRectMake(ScreenWidth, 0, ScreenWidth, 44) animated:YES];
        }else if (i == ScreenWidth){
            [topScrollView scrollRectToVisible:CGRectMake(ScreenWidth/3*2, 0, ScreenWidth, 44) animated:YES];
        }else if (i == ScreenWidth*2){
            [topScrollView scrollRectToVisible:CGRectMake(ScreenWidth/3, 0, ScreenWidth, 44) animated:YES];
        }
        NSLog(@"%d",i);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell1";

    JudgeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (cell == nil){
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"JudgeCell" owner:self options:nil];
        cell = (JudgeCell *)[nibArray objectAtIndex:0];
    }
    [cell.JudgeBtn addTarget:self action:@selector(ClickJudge) forControlEvents:UIControlEventTouchDown];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //把btn 放在UITableViewCellContentView 上面
    [cell bringSubviewToFront:cell.JudgeBtn];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"thirdtodetail" sender:self];
}

#pragma mark - 传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
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
