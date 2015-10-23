//
//  JudgeViewController.h
//  CarProduct
//
//  Created by 王硕 on 15/10/20.
//  Copyright © 2015年 王硕. All rights reserved.
//

#import "BaseViewController.h"

@interface JudgeViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@end
