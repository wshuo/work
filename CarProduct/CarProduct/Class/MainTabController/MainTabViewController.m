//
//  MainTabViewController.m
//  CarProduct
//
//  Created by 王硕 on 15/10/16.
//  Copyright © 2015年 王硕. All rights reserved.
//

#import "MainTabViewController.h"
#import "MainSheetViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "UIImage+Image.h"
#import "NSSToastInterFace.h"
#import "BaseViewController.h"
@interface MainTabViewController ()

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate =self;
    [self setUpAllChildViewController];
    UIView *BoomBar = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight-64, ScreenWidth, 64)];
    UIButton *FirstBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth/5, BoomBar.frame.size.height)];
    FirstBtn.backgroundColor = [UIColor blueColor];
    [FirstBtn addTarget:self action:@selector(Click1) forControlEvents:UIControlEventTouchDown];
    UIButton *SecondBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/5, 0, ScreenWidth/5, BoomBar.frame.size.height)];
    SecondBtn.backgroundColor = [UIColor blueColor];
    [SecondBtn addTarget:self action:@selector(Click2) forControlEvents:UIControlEventTouchDown];

    UIButton *ThirdBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth*2/5, 0, ScreenWidth/5, BoomBar.frame.size.height)];
    ThirdBtn.backgroundColor = [UIColor orangeColor];
    [ThirdBtn addTarget:self action:@selector(ClickOBD) forControlEvents:UIControlEventTouchDown];

    UIButton *FourBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth*3/5, 0, ScreenWidth/5, BoomBar.frame.size.height)];
    FourBtn.backgroundColor = [UIColor blueColor];
    [FourBtn addTarget:self action:@selector(Click3) forControlEvents:UIControlEventTouchDown];

    UIButton *FiveBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth*4/5, 0, ScreenWidth/5, BoomBar.frame.size.height)];
    FiveBtn.backgroundColor = [UIColor blueColor];
    [FiveBtn addTarget:self action:@selector(Click4) forControlEvents:UIControlEventTouchDown];
    
    BoomBar.backgroundColor = [UIColor redColor];
    
    [BoomBar addSubview:FiveBtn];
    [BoomBar addSubview:FirstBtn];
    [BoomBar addSubview:SecondBtn];
    [BoomBar addSubview:ThirdBtn];
    [BoomBar addSubview:FourBtn];
    [self.view addSubview:BoomBar];
    // Do any additional setup after loading the view.
}
-(void)Click1{
    self.selectedViewController = [self.viewControllers objectAtIndex:0];
}
-(void)Click2{
    self.selectedViewController = [self.viewControllers objectAtIndex:1];
}
-(void)Click3{
    self.selectedViewController = [self.viewControllers objectAtIndex:2];
}
-(void)Click4{
    self.selectedViewController = [self.viewControllers objectAtIndex:3];
}
-(void)ClickOBD{
    [NSSToastInterFace showToast:@"欢迎使用OBD"];
}
#pragma mark - 添加所有的子控制器
- (void)setUpAllChildViewController
{
    UIStoryboard*storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // 首页
    MainSheetViewController *home = [storyboard instantiateViewControllerWithIdentifier:@"MainSheetViewController"];
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"mainpage.png"] selectedImage:nil title:@"首页"];

    SecondViewController *second = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self setUpOneChildViewController:second image:[UIImage imageNamed:@"mainpage.png"] selectedImage:nil title:@"首页"];
    
    ThirdViewController *third = [storyboard instantiateViewControllerWithIdentifier:@"ThirdViewController"];
    [self setUpOneChildViewController:third image:[UIImage imageNamed:@"mainpage.png"] selectedImage:nil title:@"首页"];
    
    FourViewController *four = [storyboard instantiateViewControllerWithIdentifier:@"FourViewController"];
    [self setUpOneChildViewController:four image:[UIImage imageNamed:@"mainpage.png"] selectedImage:nil title:@"首页"];
}
#pragma mark - 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    
    //vc.tabBarItem.badgeValue = @"10";
    vc.tabBarItem.selectedImage = selectedImage;
    
    [self addChildViewController:vc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --tabbar
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if (tabBarController.selectedIndex == 1) {

    }
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
