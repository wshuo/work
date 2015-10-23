//
//  JudgeCell.h
//  CarProduct
//
//  Created by 王硕 on 15/10/19.
//  Copyright © 2015年 王硕. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JudgeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *CellImage;
@property (weak, nonatomic) IBOutlet UILabel *DetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *PriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *StateLabel;
@property (weak, nonatomic) IBOutlet UIButton *JudgeBtn;

@end
