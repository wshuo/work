//
//  GoodsListViewController.m
//  CarProduct
//
//  Created by 王硕 on 15/10/22.
//  Copyright © 2015年 王硕. All rights reserved.
//

#import "GoodsListViewController.h"
#import "ShopListCell.h"
@interface GoodsListViewController ()

@end

@implementation GoodsListViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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

#pragma mark - 自己的方法

#pragma mark - 重写或继承base中的方法

#pragma mark - 需要子类继承的

#pragma mark - 消息方法

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell1";
    
    ShopListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil){
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"ShopListCell" owner:self options:nil];
        cell = (ShopListCell *)[nibArray objectAtIndex:0];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"GoodsListtoDetail" sender:self];
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
