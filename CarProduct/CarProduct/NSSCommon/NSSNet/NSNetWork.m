//
//  NSNetWork.m
//  网络demo
//
//  Created by 王硕 on 15/6/2.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import "NSNetWork.h"
@implementation NSNetWork
+ (NSNetWork*)Instance
{
    static NSNetWork *obj = nil;
    @synchronized([NSNetWork class])
    {
        if (obj == nil)
        {
            obj = [[NSNetWork alloc] init];
        }
    }
    return obj;
}

//GET
//-(NSSNETRltState)NetWorkUrl:(NSString*)StrUrl TimeOut:(int)time ReciveDate:(NSData**)receiveData WithBody:(NSDictionary *)parameters{
//    NSSNETRltState rlt = NSSNETRltState_NETERROR;
//    
//    NSError *error;
//    NSString *str = [self withgeturl:[URL stringByAppendingString:StrUrl] withdata:parameters];
//    NSString * newUrl = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *url = [NSURL URLWithString:newUrl];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:time];
//    NSHTTPURLResponse *urlResponese = nil;
//    *receiveData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponese error:&error];
////    NSString *json =[[NSString alloc] initWithData:*receiveData encoding:NSUTF8StringEncoding];
//    if (*receiveData && ([urlResponese statusCode] >= 200 && [urlResponese statusCode] < 300))
//    {
//        rlt = NSSNETRltState_SUCESS;
//    }
//    else
//    {
//        rlt = [urlResponese statusCode];
//    }
//
//    return rlt;
//}

//表单
-(NSSNETRltState)NetWorkUrl:(NSString*)StrUrl TimeOut:(int)time ReciveDate:(NSData**)receiveData WithBody:(NSDictionary *)parameters{
     NSSNETRltState rlt = NSSNETRltState_NETERROR;
    NSString *TWITTERFON_FORM_BOUNDARY = @"AaB03x";
    NSString* url =[URL stringByAppendingString:StrUrl];
    //根据url初始化request
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:10];
    //分界线 --AaB03x
    NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",TWITTERFON_FORM_BOUNDARY];
    
    //结束符 AaB03x--
    NSString *endMPboundary=[[NSString alloc]initWithFormat:@"%@--",MPboundary];
    
    //得到图片的data
    NSData* data;
    
    //http body的字符串
    NSMutableString *body=[[NSMutableString alloc]init];
    
    [body appendFormat:@"%@\r\n",MPboundary];
    
    NSString *str = [self Dowith:parameters];
    [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n",@"inputParameter"];
    [body appendFormat:@"Content-Type:application/json\r\n\r\n%@\r\n",str];
    
    //声明结束符：--AaB03x--
    NSString *end=[[NSString alloc]initWithFormat:@"\r\n%@",endMPboundary];
    //声明myRequestData，用来放入http body
    NSMutableData *myRequestData=[NSMutableData data];
    
    //将body字符串转化为UTF8格式的二进制
    [myRequestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
    //添加分界线，换行
    //NSString *end=[[NSString alloc]initWithFormat:@"\r\n%@",endMPboundary];
    
    [myRequestData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",TWITTERFON_FORM_BOUNDARY];
    //设置HTTPHeader
    [request setValue:content forHTTPHeaderField:@"Content-Type"];
    //设置Content-Length
    [request setValue:[NSString stringWithFormat:@"%ld", (unsigned long)[myRequestData length]] forHTTPHeaderField:@"Content-Length"];
    //设置http body
    [request setHTTPBody:myRequestData];
    //http method
    [request setHTTPMethod:@"POST"];
    
    NSHTTPURLResponse *urlResponese = nil;
    NSError *error = [[NSError alloc]init];

    *receiveData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponese error:&error];
    if (*receiveData && ([urlResponese statusCode] >= 200 && [urlResponese statusCode] < 300))
    {
        rlt = NSSNETRltState_SUCESS;
    }
    else
    {
        rlt = [urlResponese statusCode];
    }
    
    return rlt;
}
//POST
//-(NSSNETRltState)NetWorkUrl:(NSString*)StrUrl TimeOut:(int)time ReciveDate:(NSData**)receiveData WithBody:(NSDictionary *)parameters{
//    NSSNETRltState rlt = NSSNETRltState_NETERROR;
//    
//    NSError *error;
//    NSString*str=  [self Dowith:parameters];
//    NSURL *url = [NSURL URLWithString:[URL stringByAppendingString:StrUrl]];
//    NSMutableURLRequest* request=[[NSMutableURLRequest alloc]initWithURL:url];//通过URL创建网络请求
//    [request setHTTPMethod:@"POST"];
//    [request setValue:@"application/json"forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
//    [request setTimeoutInterval:30.0];
//    NSHTTPURLResponse *urlResponese = nil;
//    *receiveData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponese error:&error];
//    NSString *str1 = [[NSString alloc]initWithData:*receiveData encoding:NSUTF8StringEncoding];
//    //    NSString *json =[[NSString alloc] initWithData:*receiveData encoding:NSUTF8StringEncoding];
//    if (*receiveData && ([urlResponese statusCode] >= 200 && [urlResponese statusCode] < 300))
//    {
//        rlt = NSSNETRltState_SUCESS;
//    }
//    else
//    {
//        rlt = [urlResponese statusCode];
//    }
//    
//    return rlt;
//}
-(NSString*)Dowith:(NSDictionary*)dic{
    NSArray *array = [dic allKeys];
    NSArray *array1 = [dic allValues];
    NSMutableString *sendStr = [NSMutableString string];
    [sendStr appendFormat:@"{"];
    for (int i = 0 ; i<[array count]; i++) {
        [sendStr appendFormat:[array objectAtIndex:i]];
        [sendStr appendFormat:@":"];
        if ([[array1 objectAtIndex:i] isKindOfClass:[NSNumber class]]) {
            NSString *str;
            NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
            str = [numberFormatter stringFromNumber:[array1 objectAtIndex:i]];
            [sendStr appendFormat:str];
        }else{
            [sendStr appendFormat:[array1 objectAtIndex:i]];
        }
        if (i+1 == [array count]) {
        }else{
            [sendStr appendFormat:@","];
        }
    }
    [sendStr appendString:@"}"];
    return sendStr;
}

//-(NSString*)withgeturl:(NSString *)url withdata:(NSDictionary*)dic{
//    NSArray *array = [dic allKeys];
//    NSArray *array1 = [dic allValues];
//    NSMutableString *sendStr = [NSMutableString string];
//    [sendStr appendFormat:@"?inputParameter={"];
//    for (int i = 0 ; i<[array count]; i++) {
//        [sendStr appendFormat:[array objectAtIndex:i]];
//        [sendStr appendFormat:@":"];
//        if ([[array1 objectAtIndex:i] isKindOfClass:[NSNumber class]]) {
//            NSString *str;
//            NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
//            str = [numberFormatter stringFromNumber:[array1 objectAtIndex:i]];
//            [sendStr appendFormat:str];
//        }else{
//            [sendStr appendFormat:[array1 objectAtIndex:i]];
//        }
//        if (i+1 == [array count]) {
//        }else{
//            [sendStr appendFormat:@","];
//        }
//    }
//    [sendStr appendString:@"}"];
//    NSString *url1 = [url stringByAppendingString:sendStr];
//    return url1;
//}

@end
