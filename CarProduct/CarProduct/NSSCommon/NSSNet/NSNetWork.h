//
//  NSNetWork.h
//  网络demo
//
//  Created by 王硕 on 15/6/2.
//  Copyright (c) 2015年 王硕. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "LoadingViewManager.h"
//#define URL @"http://192.168.1.170:8080/pt365_app_server/"
//#define URL @"http://192.168.1.155:8080/pt365_app_server/"
//#define URL @"http://124.95.128.23:8090/pt365_app_server/"
//http://121.40.122.151:8090/pt365_app_server/
#define URL @"http://121.40.122.151:8090/pt365_app_server/"
//#define URL @"http://124.95.128.21:8090/pt365_app_server/"


typedef NS_ENUM(NSInteger, NSSNETRltState)
{
    NSSNETRltState_URLERROR = -1,
    NSSNETRltState_NETERROR = 0,
    NSSNETRltState_SUCESS = 200,
    NSSNETRltState_OVERDUE = 403,
    NSSNETRltState_NOTFOUNDSEVER = 404,
    NSSNETRltState_SEVERErro = 500,
};

@interface NSNetWork : NSObject
+ (NSNetWork*)Instance;
-(NSSNETRltState)NetWorkUrl:(NSString*)url TimeOut:(int)time ReciveDate:(NSData**)data WithBody:(NSDictionary*)dic;
@end
