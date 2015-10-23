//
//  GoodsDetailViewController.m
//  CarProduct
//
//  Created by 王硕 on 15/10/22.
//  Copyright © 2015年 王硕. All rights reserved.
//

#import "GoodsDetailViewController.h"

@interface GoodsDetailViewController (){
    UIImageView *imageView;
    CGFloat kImageOriginHight;
    CGFloat kTempHeight;
}

@end

@implementation GoodsDetailViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    kImageOriginHight = 200;
    kTempHeight = 80.0f;
    self.tableview.contentInset = UIEdgeInsetsMake(kImageOriginHight, 0, 0, 0);
    imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"]];
    imageView.frame = CGRectMake(0, -kImageOriginHight - kTempHeight, self.view.frame.size.width, kImageOriginHight + kTempHeight);
    [self.tableview addSubview:imageView];
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, -kTempHeight, self.view.frame.size.width, kTempHeight)];
    topView.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:0.7];
    [self.tableview addSubview:topView];
    
    self.tableview.backgroundColor = [UIColor blackColor];
    self.tableview.tableFooterView = [[UIView alloc]init];
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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset  = scrollView.contentOffset.y;
    NSLog(@"yOffset===%f",yOffset);
    CGFloat xOffset = (yOffset + kImageOriginHight)/2;
    if (yOffset < -kImageOriginHight) {
        if ( yOffset<-250 ) {
            return;
        }
        CGRect f = imageView.frame;
        f.origin.y = yOffset - kTempHeight;
        f.size.height =  -yOffset + kTempHeight;
        //f.origin.x = xOffset;
        f.size.width = self.view.frame.size.width;
        imageView.frame = f;
        //        self.tableview.contentInset = UIEdgeInsetsMake(kImageOriginHight-yOffset, 0, 0, 0);
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 80;
    }else if (indexPath.row == 1){
        return 43.5;
    }
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
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
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    for (UIView *view in [cell subviews]) {
        if ([view isKindOfClass:[UIImageView class]]) {
            NSLog(@"UIimageview");
        }
    }
    cell.selectionStyle = UITableViewCellEditingStyleNone;
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
