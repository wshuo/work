//
//  NSSFileManager.m
//  Errands_IOS
//
//  Created by 王硕 on 15/6/8.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import "NSSFileManager.h"
@interface NSSFileManager(){
   }
@end

@implementation NSSFileManager
//+ (NSSFileManager*)Instance
//{
//    static NSSFileManager *obj = nil;
//    @synchronized([NSSFileManager class])
//    {
//        if (obj == nil)
//        {
//            obj = [[NSSFileManager alloc] init];
//        }
//        
//    }
//    return obj;
//}

//+ (NSString*)getAccountPath
//{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) ; //得到documents的路径，为当前应用程序独享
//    
//    NSString *documentD = [paths objectAtIndex:0];
//    
//    
//    NSString *constpath = [documentD stringByAppendingPathComponent:@"PersonAccount"];
//    return constpath;
//}
+(void) writein:(NSDictionary*)parameters filename:(NSString *)filename{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:&error];
    NSString *json =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *documentsDirectory= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    [[NSFileManager defaultManager]createDirectoryAtPath: [NSString stringWithFormat:@"%@/myFolder", NSHomeDirectory()] attributes:nil];
    NSString *filePath= [documentsDirectory stringByAppendingPathComponent:filename];
    [json writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
}
+(NSDictionary *) read:(NSString*)filePath{
    NSError *error;
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *documentsDirectory= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath1= [documentsDirectory stringByAppendingPathComponent:filePath];
    NSData *myData = [fileMgr contentsAtPath:filePath1];
    if (myData == nil) {
        NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:@"2",@"loginin",nil];
        return parameters;
    }
    //NSString *str2=[[NSString alloc]initWithData:myData encoding:NSUTF8StringEncoding];
    NSDictionary *info = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableLeaves error:&error];
    return info;
}
@end
