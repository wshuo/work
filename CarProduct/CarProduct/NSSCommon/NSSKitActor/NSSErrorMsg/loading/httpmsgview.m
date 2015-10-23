//
//  loading.m
//  掌上人社通
//
//  Created by 王硕 on 14-6-18.
//  Copyright (c) 2014年 王硕. All rights reserved.
//

#import "httpmsgview.h"
#import "baseViewController.h"
@implementation httpmsgview
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        UIColor *testColor1= [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
        view.backgroundColor = testColor1;
        UIImageView *newImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_network_err.png"]];
        newImageView.frame = CGRectMake(self.frame.size.width/2-60, 107, 121, 93);
        UIImageView *newImageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"text_info.png"]];
        newImageView1.frame =CGRectMake(self.frame.size.width/2-113,220,226,28);
        [view addSubview:newImageView];
        [view addSubview:newImageView1];
        [self addSubview:view];
        // Initialization code
    }
    return self;
}
@end

@implementation UIView(httpmsgview)

-(httpmsgview*)activity1{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    UIColor *testColor1= [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    view.backgroundColor = testColor1;
    UIImageView *newImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_network_err.png"]];
    newImageView.frame = CGRectMake(self.frame.size.width/2-60, 107, 121, 93);
    UIImageView *newImageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"text_info.png"]];
    newImageView1.frame =CGRectMake(self.frame.size.width/2-113,220,226,28);
    [view addSubview:newImageView];
    [view addSubview:newImageView1];
    [self addSubview:view];

    return self;
}

@end
