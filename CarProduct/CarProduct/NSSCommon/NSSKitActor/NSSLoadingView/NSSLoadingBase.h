//
//  LoadingViewManager.h
//  Errands_IOS
//
//  Created by 王硕 on 15/6/9.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LoadingViewManager.h"

@interface NSSLoadingBase : UIView
{
    
}
@property (nonatomic, strong) NSString *nameID;
@property (nonatomic, weak) id delegate;
@property (nonatomic, strong) id annexObj;

@end
