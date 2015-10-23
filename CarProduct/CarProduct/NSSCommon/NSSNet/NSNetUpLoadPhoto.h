//
//  NSNetUpLoadPhoto.h
//  Errands_IOS
//
//  Created by 王硕 on 15/7/1.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadingViewManager.h"

#define PHOTONAME @"photoname"
@interface NSNetUpLoadPhoto : NSObject
- (NSData *)uploadRequestWithURL: (NSString *)url  // IN
                        postParams: (NSMutableDictionary *)postParams // IN
                        picFilePath: (NSString *)picFilePath  // IN
                        picFileName: (NSString *)picFileName
                        withData:(NSDictionary *)parameters;  // IN
- (UIImage *) imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize) newSize;
- (NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName;
+ (NSNetUpLoadPhoto*)Instance;
@end
