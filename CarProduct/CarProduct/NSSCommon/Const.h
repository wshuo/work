//
//  Const.h
//  lovgou
//
//  Created by end on 14-2-7.
//  Copyright (c) 2014年 end. All rights reserved.
//

#ifndef lovgou_Const_h
#define lovgou_Const_h
#include "AppDelegate.h"
#import "sys/utsname.h"

//获取设备名字
struct utsname systemInfo;
//uname(&systemInfo);
//bundow
#define BUNDLE ([NSBundle mainBundle])
#define deviceString [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding]
#define iphone4_4s [deviceString isEqualToString:@"iPhone3,1"]||[deviceString isEqualToString:@"iPhone4,1"]
#define iphone5 [deviceString isEqualToString:@"iPhone5,2"]

#define VERSIONAPP ([[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleVersion"])

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

//iPhone5判断
#define MainScreenBounds [[UIScreen mainScreen] bounds]
#define IS_IPHONE_5 (fabs(( double ) MainScreenBounds.size.height - (double)568) < DBL_EPSILON)

//ios 7判断
#define IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0f)
#define IOS_8 ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0f)


#define APDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#endif
