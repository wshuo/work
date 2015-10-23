//
//  PaySuccessController.m
//  CarProduct
//
//  Created by mac on 15/10/20.
//  Copyright © 2015年 王硕. All rights reserved.
//

#import "PaySuccessController.h"

@interface PaySuccessController ()

@end

@implementation PaySuccessController

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
//设置cell显示的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return 4;
}
//设置cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 48;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
