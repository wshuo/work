//
//  NSSTaskObj.h
//  线程池
//
//  Created by 王硕 on 15/6/4.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSSTaskObj;
@protocol NSSTaskProtocol <NSObject>
@optional
//线程池中的任务
- (void)runTask:(NSSTaskObj *)taskObj;
//切换到主线程的任务
- (void)runTaskOnMainThread:(NSSTaskObj *)taskObj;

@end

@interface NSSTaskObj : NSObject
{
@protected
    __weak id<NSSTaskProtocol> _taskDelegate;
}
@property (nonatomic, weak) id<NSSTaskProtocol> taskDelegate;
@property (nonatomic, strong) NSString *taskName;
@property (nonatomic, strong) id annexObj;
@property (nonatomic, strong) NSString *annexStr;
@property (nonatomic) NSInteger annexInteger;
@property (nonatomic, strong) NSArray *annexArray;


@end
