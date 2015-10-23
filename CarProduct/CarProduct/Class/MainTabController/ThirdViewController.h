//
//  ThirdViewController.h
//  CarProduct
//
//  Created by 王硕 on 15/10/16.
//  Copyright © 2015年 王硕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface ThirdViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *TopScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *BoomScrollView;

@end
