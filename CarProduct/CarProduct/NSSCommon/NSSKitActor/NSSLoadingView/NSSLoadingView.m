//
//  NSSLoadingView.m
//  Errands_IOS
//
//  Created by 王硕 on 15/6/9.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import "NSSLoadingView.h"
#import "NSSPoolTask.h"
#import "LoadingViewManager.h"
@implementation NSSLoadingView

-(void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        [_Actor startAnimating];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        self.SmallView.backgroundColor = [UIColor grayColor];
        _SmallView.layer.cornerRadius = 8;
        _SmallView.layer.borderWidth = 0;
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    LoadingViewManager *obj = [[LoadingViewManager alloc]init];
    obj.loadDelegate = self.delegate;
    if (obj.loadDelegate && [obj.loadDelegate respondsToSelector:@selector(responseIndex:obj:)])
    {
        [obj.loadDelegate responseIndex:0 obj:self];
        [self removeFromSuperview];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
