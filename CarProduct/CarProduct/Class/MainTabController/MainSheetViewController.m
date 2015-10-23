//
//  MainSheetViewController.m
//  CarProduct
//
//  Created by 王硕 on 15/10/16.
//  Copyright © 2015年 王硕. All rights reserved.
//

#import "MainSheetViewController.h"
#import "ShopListCell.h"
@interface MainSheetViewController ()

@end

@implementation MainSheetViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.TableView.tableFooterView = [[UIView alloc]init];
    self.TableView.backgroundColor = [UIColor grayColor];
//    self.TableView.tableFooterView.backgroundColor = [UIColor redColor];
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
    switch (indexPath.row) {
        case 0:
            return 88;
            break;
        case 1:
            return 106;
            break;
        case 2:
            return 100;
            break;
        case 3:
            return 100;
            break;
        default:
            break;
    }
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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
        default:
            break;
    }
    
    if (indexPath.row == 3) {
        ShopListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil){
            NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"ShopListCell" owner:self options:nil];
            cell = (ShopListCell *)[nibArray objectAtIndex:0];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
