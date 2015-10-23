//
//  NSSTextFiled.m
//  For Delivery Man
//
//  Created by 王硕 on 15/7/23.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import "NSSTextFiled.h"

@implementation NSSTextFiled

-(void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        self.mainfield.delegate =self;
        
        _textFeildLeftImageView = [[UIImageView alloc]init];
        _textFeildLeftImageView.frame = CGRectMake(10,(self.frame.size.height-20)*0.5,20,20);
        [self addSubview:_textFeildLeftImageView];
        
        _baseTextField = [[UITextField alloc] init];
        self.layer.cornerRadius = 8.0;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [[UIColor grayColor]CGColor];
        _baseTextField.backgroundColor = [UIColor clearColor];
        _baseTextField.frame = CGRectMake(40,0,self.frame.size.width-40,self.frame.size.height);
        _baseTextField.delegate =self;
        [self addSubview:_baseTextField];
    }
}
-(void)drawRect:(CGRect)rect{

}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.layer.borderWidth = 1;
    self.layer.borderColor = [[UIColor orangeColor]CGColor];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.layer.borderColor = [[UIColor grayColor]CGColor];

}
@end
