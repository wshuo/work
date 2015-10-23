//
//  NSSLoadingView.h
//  Errands_IOS
//
//  Created by 王硕 on 15/6/9.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSSLoadingBase.h"

@interface NSSLoadingView : NSSLoadingBase
@property (weak, nonatomic) IBOutlet UIView *SmallView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *Actor;

@end
