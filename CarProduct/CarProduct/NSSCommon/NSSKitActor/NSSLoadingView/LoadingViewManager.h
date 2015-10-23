//
//  LoadingViewManager.h
//  Errands_IOS
//
//  Created by 王硕 on 15/6/9.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSSLoadingBase.h"

@class NSSLoadingBase;
@protocol NSSLoadProtocol <NSObject>
@optional
- (void)responseIndex:(NSInteger)index obj:(NSSLoadingBase *)view;
@end

@interface LoadingViewManager : NSObject{
@protected
    __weak id<NSSLoadProtocol> _loadDelegate;
}
@property (nonatomic, weak) id<NSSLoadProtocol> loadDelegate;

-(void)AddLoadingNamed:(NSString *)name delegate:(__weak id<NSSLoadProtocol>)delegate;
-(void)removewLoadingNamed:(NSString *)name delegate:(__weak id<NSSLoadProtocol>)delegate;
+ (LoadingViewManager*)Instance;
@end
