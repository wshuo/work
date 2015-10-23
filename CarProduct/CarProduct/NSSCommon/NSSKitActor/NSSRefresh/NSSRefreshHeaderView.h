//
//  SDRefreshHeaderView.h
//  SDRefreshView
//
//  Created by aier on 15-2-22.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "NSSRefreshView.h"

@interface NSSRefreshHeaderView : NSSRefreshView{
    CGFloat _originalScrollViewContentHeight;
}

- (void)beginRefreshing;

@end
