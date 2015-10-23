//
//  JudgeViewController.m
//  CarProduct
//
//  Created by 王硕 on 15/10/20.
//  Copyright © 2015年 王硕. All rights reserved.
//

#import "JudgeViewController.h"
#import "JudgeDetailCell.h"
#import "JudgeStarBtnCell.h"
@interface JudgeViewController (){
    UIScrollView *topScrollView;
    UIScrollView *MainScrollView;
    UIButton *FirstBtn;
    UIButton *SecondBtn;
    UIButton *ThirdBtn;
}

@end

@implementation JudgeViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat footerHeight = ScreenHeight - 100.0 * 2 - 64;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, footerHeight)];
    view.backgroundColor = [UIColor grayColor];
    self.TableView.tableFooterView = view;
    [self initTopView:view];
    [self initMainView:view];
    // Do any additional setup after loading the view.
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
-(IBAction)ClickStar:(id)sender{
    UIButton *btn = sender;
    NSIndexPath *Path = [NSIndexPath indexPathForRow:1 inSection:0];
    JudgeStarBtnCell *cell = [self.TableView cellForRowAtIndexPath:Path];
    if (btn.tag == 1001) {
        [cell.Btn1 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn2 setTitle:@"0" forState:UIControlStateNormal];
        [cell.Btn3 setTitle:@"0" forState:UIControlStateNormal];
        [cell.Btn4 setTitle:@"0" forState:UIControlStateNormal];
        [cell.Btn5 setTitle:@"0" forState:UIControlStateNormal];
    }else if (btn.tag == 1002){
        [cell.Btn1 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn2 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn3 setTitle:@"0" forState:UIControlStateNormal];
        [cell.Btn4 setTitle:@"0" forState:UIControlStateNormal];
        [cell.Btn5 setTitle:@"0" forState:UIControlStateNormal];
    }else if (btn.tag == 1003){
        [cell.Btn1 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn2 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn3 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn4 setTitle:@"0" forState:UIControlStateNormal];
        [cell.Btn5 setTitle:@"0" forState:UIControlStateNormal];
    }else if (btn.tag == 1004){
        [cell.Btn1 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn2 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn3 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn4 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn5 setTitle:@"0" forState:UIControlStateNormal];
    }else if (btn.tag == 1005){
        [cell.Btn1 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn2 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn3 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn4 setTitle:@"1" forState:UIControlStateNormal];
        [cell.Btn5 setTitle:@"1" forState:UIControlStateNormal];
    }
}
#pragma mark - 自己的方法
-(void)initTopView:(UIView *)view{
    topScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    topScrollView.scrollEnabled = NO;
    [topScrollView setContentSize:CGSizeMake(ScreenWidth*3, 44)];
    [topScrollView scrollRectToVisible:CGRectMake(ScreenWidth, 0, ScreenWidth, 44) animated:NO];
    topScrollView.backgroundColor = [UIColor clearColor];
    FirstBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth/3, 40)];
    [FirstBtn setTitle:@"全部" forState:UIControlStateNormal];
    [FirstBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [FirstBtn addTarget:self action:@selector(ClickFirst) forControlEvents:UIControlEventTouchDown];
    FirstBtn.backgroundColor = [UIColor whiteColor];
    
    SecondBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/3, 0, ScreenWidth/3, 40)];
    [SecondBtn setTitle:@"好评" forState:UIControlStateNormal];
    [SecondBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [SecondBtn addTarget:self action:@selector(ClickSecond) forControlEvents:UIControlEventTouchDown];
    SecondBtn.backgroundColor = [UIColor whiteColor];
    
    ThirdBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/3*2, 0, ScreenWidth/3, 40)];
    [ThirdBtn setTitle:@"差评" forState:UIControlStateNormal];
    [ThirdBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [ThirdBtn addTarget:self action:@selector(ClickThird) forControlEvents:UIControlEventTouchDown];
    ThirdBtn.backgroundColor = [UIColor whiteColor];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth/3, 44)];
    bgView.backgroundColor = [UIColor blueColor];
    [topScrollView addSubview:bgView];
    
    [view addSubview:topScrollView];
    [view addSubview:FirstBtn];
    [view addSubview:SecondBtn];
    [view addSubview:ThirdBtn];
}
-(void)initMainView:(UIView*)view{
    CGFloat footerHeight = view.frame.size.height;
    MainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, ScreenWidth, footerHeight - 44)];
    MainScrollView.pagingEnabled = YES;
    MainScrollView.delegate = self;
    [MainScrollView setContentSize:CGSizeMake(ScreenWidth*3, footerHeight - 44)];
    [MainScrollView scrollRectToVisible:CGRectMake(0, 0, ScreenWidth, footerHeight - 44) animated:NO];
    MainScrollView.backgroundColor = [UIColor blueColor];
    [view addSubview:MainScrollView];
    
    UITableView *table1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, MainScrollView.frame.size.height)];
    table1.delegate = self;
    table1.dataSource = self;
    table1.bounces = NO;
    [MainScrollView addSubview:table1];
    
    UITableView *table2 = [[UITableView alloc]initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, MainScrollView.frame.size.height)];
    table2.delegate = self;
    table2.dataSource = self;
    table2.bounces = NO;
    [MainScrollView addSubview:table2];
    
    UITableView *table3 = [[UITableView alloc]initWithFrame:CGRectMake(ScreenWidth*2, 0, ScreenWidth, MainScrollView.frame.size.height)];
    table3.delegate = self;
    table3.dataSource = self;
    table3.bounces = NO;
    [MainScrollView addSubview:table3];
}
-(void)ClickFirst{
    [topScrollView scrollRectToVisible:CGRectMake(ScreenWidth, 0, ScreenWidth, 44) animated:YES];
    [MainScrollView scrollRectToVisible:CGRectMake(0, 0, ScreenWidth,  ScreenHeight-128-44) animated:YES];
    [FirstBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [SecondBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [ThirdBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}
-(void)ClickSecond{
    [topScrollView scrollRectToVisible:CGRectMake(ScreenWidth/3*2, 0, ScreenWidth, 44) animated:YES];
    [MainScrollView scrollRectToVisible:CGRectMake(ScreenWidth, 0, ScreenWidth,  ScreenHeight-128-44) animated:YES];
    [FirstBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [SecondBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [ThirdBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}
-(void)ClickThird{
    [topScrollView scrollRectToVisible:CGRectMake(ScreenWidth/3, 0, ScreenWidth, 44) animated:YES];
    [MainScrollView scrollRectToVisible:CGRectMake(ScreenWidth*2, 0, ScreenWidth,  ScreenHeight-128-44) animated:YES];
    [FirstBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [SecondBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [ThirdBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
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
            [FirstBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [SecondBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [ThirdBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

        }else if (i == ScreenWidth){
            [topScrollView scrollRectToVisible:CGRectMake(ScreenWidth/3*2, 0, ScreenWidth, 44) animated:YES];
            [FirstBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [SecondBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [ThirdBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

        }else if (i == ScreenWidth*2){
            [topScrollView scrollRectToVisible:CGRectMake(ScreenWidth/3, 0, ScreenWidth, 44) animated:YES];
            [FirstBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [SecondBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [ThirdBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
        NSLog(@"%d",i);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.TableView]) {
        switch (indexPath.row) {
            case 0:
                return 40;
                break;
            case 1:
                return 150;
                break;
            default:
                break;
        }
    }
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:self.TableView]) {
        NSString *cellIdentifier;
        switch (indexPath.row) {
            case 0:
                cellIdentifier = @"cell1";
                break;
            default:
                break;
        }
        if (indexPath.row == 1) {
            static NSString *cellIdentifier = @"cell";
            
            JudgeStarBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            
            if (cell == nil){
                NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"JudgeStarBtnCell" owner:self options:nil];
                cell = (JudgeStarBtnCell *)[nibArray objectAtIndex:0];
            }
            cell.Btn1.tag = 1001;
            cell.Btn2.tag = 1002;
            cell.Btn3.tag = 1003;
            cell.Btn4.tag = 1004;
            cell.Btn5.tag = 1005;
            [cell.Btn1 addTarget:self action:@selector(ClickStar:) forControlEvents:UIControlEventTouchDown];
            [cell.Btn2 addTarget:self action:@selector(ClickStar:) forControlEvents:UIControlEventTouchDown];
            [cell.Btn3 addTarget:self action:@selector(ClickStar:) forControlEvents:UIControlEventTouchDown];
            [cell.Btn4 addTarget:self action:@selector(ClickStar:) forControlEvents:UIControlEventTouchDown];
            [cell.Btn5 addTarget:self action:@selector(ClickStar:) forControlEvents:UIControlEventTouchDown];
            [cell sendSubviewToBack:[[cell subviews]lastObject]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        for (UIView *view in [cell subviews]) {
            if ([view isKindOfClass:[UIImageView class]]) {
                NSLog(@"UIimageview");
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        static NSString *cellIdentifier = @"cell1";
        
        JudgeDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil){
            NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"JudgeDetailCell" owner:self options:nil];
            cell = (JudgeDetailCell *)[nibArray objectAtIndex:0];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
