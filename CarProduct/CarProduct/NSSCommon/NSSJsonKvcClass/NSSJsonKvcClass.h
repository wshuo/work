//
//  NSSJsonKvcClass.h
//  掌上人社通
//
//  Created by dike on 14-11-14.
//  Copyright (c) 2014年 王硕. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSJsonKvcClass : NSObject

//将json字典数据转成类对象
- (BOOL)setJsonDataWithDic:(NSDictionary *)jsonData;

//如果属性名与字段名对不上时重写这个方法,NSARRAY 必须重写
- (NSString *)changePropertyType:(NSString*)proname;

//通过对象返回一个NSDictionary，键是属性名称，值是属性值。
- (NSDictionary*)getObjectData;

//将getObjectData方法返回的NSDictionary转化成JSON
- (NSData*)getJSONOptions:(NSJSONWritingOptions)options error:(NSError**)erro;

@end
