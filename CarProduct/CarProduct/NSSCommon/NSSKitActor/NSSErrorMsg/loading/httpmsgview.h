//
//  httpmsgview.h
//  掌上人社通
//
//  Created by 王硕 on 14-9-16.
//  Copyright (c) 2014年 王硕. All rights reserved.
//


#import <UIKit/UIKit.h>

#define cycleAnimationDuration 0.8
#define numberOfFramesInAnimation 14
#define spriteNameString @"wait_100"
@interface httpmsgview : UIView
//-(httpmsgview*)activity1;
//-(loading*)activity;
-(UIView*)activity1;
@end

@interface UIView (httpmsgview)


-(httpmsgview*)activity1;
@end
