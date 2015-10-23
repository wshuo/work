//
//  Maintop_upViewController.m
//  CarProduct
//
//  Created by 王硕 on 15/10/16.
//  Copyright © 2015年 王硕. All rights reserved.
//

#import "Maintop_upViewController.h"

@interface Maintop_upViewController ()

@end

@implementation Maintop_upViewController



- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *view =[[UIView alloc]init];
   // view.backgroundColor=[UIColor ];
    //设置footer
    self.zhifu_tableview.tableFooterView=view;
    //设置tableview背景颜色
    self.zhifu_tableview.backgroundColor=[UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    //self.zhifu_tableview.tableFooterView.backgroundColor=[UIColor grayColor];
    
    
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

#pragma mark - 传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0||indexPath.row==4){
    
        
        return 15;
    }
    
    return 48;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0;
}
- (NSInteger) tableView: (UITableView*)tableView numberOfRowsInSection: (NSInteger)section {
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier;
    switch (indexPath.row) {
        case 0:
            cellIdentifier = @"cell1";
            break;
        case 1:
            cellIdentifier = @"cell2";
            break;
        case 2:
            cellIdentifier = @"cell3";
            break;
        case 3:
            cellIdentifier = @"cell4";
            break;
        case 4:
            cellIdentifier = @"cell5";
            break;
        case 5:
            cellIdentifier = @"cell6";
            break;
        default:
            break;
    }
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    for (UIView *view in [cell subviews]) {
//        if ([view isKindOfClass:[UIImageView class]]) {
//            NSLog(@"UIimageview");
//        }
        
    }

    
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{




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
