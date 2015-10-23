//
//  NSSTextFiled.h
//  For Delivery Man
//
//  Created by 王硕 on 15/7/23.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSSTextFiled : UIView<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *leftimage;
@property (weak, nonatomic) IBOutlet UITextField *mainfield;
@property(nonatomic, strong)UITextField* baseTextField;
@property(nonatomic, strong)UIImageView* textFeildLeftImageView;
- (void)textFieldDidBeginEditing:(UITextField *)textField;
- (void)textFieldDidEndEditing:(UITextField *)textField;
@end
