//
//  BaseViewController.h
//  Errands_IOS
//
//  Created by 王硕 on 15/5/20.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSSToastInterFace.h"
#import "StoryboardPushSegue.h"
#import "LoadingViewManager.h"
#import "httpmsgview.h"

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface BaseViewController : UIViewController<NSSLoadProtocol>{
@private
    NSObject *_segueSnderObj;
}

- (IBAction)popToLastCell:(id)sender;
- (IBAction)popToRootCell:(id)sender;
- (void)doPreForSegue:(UIStoryboardSegue *)segue;
- (void)performSegueWithIdentifier1:(NSString *)identifier sender:(id)sender;
@end
