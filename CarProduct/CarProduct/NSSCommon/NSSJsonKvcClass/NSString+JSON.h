//
//  NSString+JSON.h
//  掌上人社通
//
//  Created by dike on 14-11-21.
//  Copyright (c) 2014年 王硕. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)
//将NSString ，NSArray， NSDic 转成json字符串
+(NSString *) jsonStringWithObject:(id) object;
@end
