//
//  NSSFileManager.h
//  Errands_IOS
//
//  Created by 王硕 on 15/6/8.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSFileManager : NSObject
+(void) writein:(id)parameters filename:(NSString *)filename;
//+ (NSSFileManager*)Instance;
+(NSDictionary *) read:(NSString*)filePath;
@end
