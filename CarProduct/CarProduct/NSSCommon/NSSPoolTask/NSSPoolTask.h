//
//  NSSPoolTask.h
//  线程池
//
//  Created by 王硕 on 15/6/4.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSSTaskObj.h"
@interface NSSPoolTask : NSObject{
    NSSTaskObj *object;
}
//@property(nonatomic,strong)NSThread *threadNew;
+ (NSSPoolTask*)Instance;
- (void)taskToMainThread:(NSSTaskObj *)taskObj isWait:(BOOL)isWait;
- (void)startTaskThread:(NSSTaskObj *)taskObj;
- (void)cancelWithTaskObj:(NSSTaskObj *)taskObj;
- (void)stopThread:(NSString*)TaskName;
@end



