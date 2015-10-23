//
//  NSSToastInterFace.m
//  StatrWork
//
//  Created by w.shuo on 15-3-12.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import "NSSToastInterFace.h"
#import "NSSToastManger.h"

@implementation NSSToastInterFace


+ (void)showToast:(NSString *)text
{
    [[NSSToastManger Instance] showToast:text];
}


@end
