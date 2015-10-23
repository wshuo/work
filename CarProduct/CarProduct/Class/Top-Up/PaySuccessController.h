//
//  PaySuccessController.h
//  CarProduct
//
//  Created by mac on 15/10/20.
//  Copyright © 2015年 王硕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface PaySuccessController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *paySuccess_tableview;

@end
