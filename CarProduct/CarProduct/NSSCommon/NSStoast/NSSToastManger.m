//
//  NSSToastManger.m
//  StatrWork
//
//  Created by w.shuo on 15-3-12.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import "NSSToastManger.h"
#import "NSSToastView.h"

@interface NSSToastManger ()
{
    @private
    __weak NSSToastView *_toastView;
}

@end

@implementation NSSToastManger

+ (NSSToastManger*)Instance
{
    static NSSToastManger *obj = nil;
    @synchronized([NSSToastManger class])
    {
        if (obj == nil)
        {
            obj = [[NSSToastManger alloc] init];
        }
        
    }
    return obj;
}

- (NSSToastView *)getToastView
{
    if (!_toastView)
    {
        NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:@"NSSToastView" owner:self options:nil]; //通过这个方法,取得我们的视图
        _toastView = [nibViews objectAtIndex:0];
    }
    return _toastView;
}

- (void)showToast:(NSString *)text
{
    NSSToastView *view = [self getToastView];
    [view setText:text];
    [view show];
}


@end
