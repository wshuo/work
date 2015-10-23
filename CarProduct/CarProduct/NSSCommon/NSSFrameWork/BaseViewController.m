//
//  BaseViewController.m
//  Errands_IOS
//
//  Created by 王硕 on 15/5/20.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

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

- (IBAction)popToLastCell:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)popToRootCell:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark - 与XIB绑定事件


#pragma mark - 自己的方法

#pragma mark - 重写或继承base中的方法
- (void)performSegueWithIdentifier1:(NSString *)identifier sender:(id)sender
{
    _segueSnderObj = sender;
    [super performSegueWithIdentifier:identifier sender:sender];
}
#pragma mark - 需要子类继承的
- (void)prepareForSegueByNSS:(StoryboardPushSegue *)segue sender:(id)sender
{
    
}
- (void)doPreForSegue:(StoryboardPushSegue *)segue
{
    [self prepareForSegueByNSS:segue sender:_segueSnderObj];
}

#pragma mark - 消息方法


#pragma mark - 代理方法


@end
