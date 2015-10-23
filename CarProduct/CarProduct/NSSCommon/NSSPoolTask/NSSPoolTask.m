//
//  NSSPoolTask.m
//  线程池
//
//  Created by 王硕 on 15/6/4.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import "NSSPoolTask.h"
@interface NSSPoolTask(){
    NSMutableArray *TaskArray;
    NSMutableArray *_executeArray;
    NSLock *_taskLock;
    NSLock *_arrayLock;
    NSLock *_executeLock;
}

@end
@implementation NSSPoolTask
//@synthesize threadNew;
+ (NSSPoolTask*)Instance
{
    static NSSPoolTask *obj = nil;
    @synchronized([NSSPoolTask class])
    {
        if (obj == nil)
        {
            obj = [[NSSPoolTask alloc] init];
        }
        
    }
    return obj;
}

- (instancetype)init
{
    id obj = [super init];
    
    if (obj)
    {
        _taskLock = [[NSLock alloc] init];
        _arrayLock = [[NSLock alloc]init];
        _executeLock = [[NSLock alloc]init];
        [_taskLock setName:@"TASKPOOLLOCK"];
        [_arrayLock setName:@"ARRAYPOOLLOCK"];
        [_executeLock setName:@"EXECUTEPOOLLOCK"];
        TaskArray = [[NSMutableArray alloc]init];
        _executeArray = [[NSMutableArray alloc] init];
    }
    
    return obj;
}

- (void)startTaskThread:(NSSTaskObj *)taskObj
{
    [_taskLock lock];
    [TaskArray addObject:taskObj];
    NSThread * threadNew = [[NSThread alloc] initWithTarget:self selector:@selector(runThread:) object:nil];
    [threadNew start];
    threadNew = nil;
    [_taskLock unlock];
}

- (NSSTaskObj *)getTaskObj
{
    NSSTaskObj *useTask = nil;
    [_arrayLock lock];
    if ([TaskArray count] > 0)
    {
        useTask = [TaskArray objectAtIndex:0];
        [TaskArray removeObject:useTask];
    }
    if (useTask) {
        [_executeArray addObject:useTask];
    }
    [_arrayLock unlock];
    return useTask;
}

- (void)runThread:(id)sender
{
    NSSTaskObj *TaskObj = [self getTaskObj];
    if (TaskObj.taskDelegate && [TaskObj.taskDelegate respondsToSelector:@selector(runTaskOnMainThread:)])
    {
        [TaskObj.taskDelegate runTask:TaskObj];
    }else{
        [NSThread exit];
    }
}

- (void)taskToMainThread:(NSSTaskObj *)taskObj isWait:(BOOL)isWait
{
    [self performSelectorOnMainThread:@selector(runOnMain:) withObject:taskObj waitUntilDone:NO];
}
#pragma mark - 主线程
- (void)runOnMain:(id)sender
{
    //主线程进行
    NSSTaskObj *obj = (NSSTaskObj *)sender;

    if (obj.taskDelegate && [obj.taskDelegate respondsToSelector:@selector(runTaskOnMainThread:)])
    {
            [obj.taskDelegate runTaskOnMainThread:obj];
    }
}
- (void)addExecuteArray:(NSSTaskObj *)taskObj
{
    [_executeLock lock];
    [_executeArray addObject:taskObj];
    [_executeLock unlock];
}

- (void)cancelWithTaskObj:(NSSTaskObj *)taskObj
{
    taskObj.taskDelegate = nil;
}

- (void)stopThread:(NSString*)TaskName{
    for (int i =0 ; i<[_executeArray count]; i++) {
        NSSTaskObj *TaskObj = [_executeArray objectAtIndex:i];
        if ([TaskObj.taskName isEqualToString:TaskName]) {
            TaskObj.taskDelegate =nil;
        }
    }
}

@end
