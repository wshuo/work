//
//  NSNetUpLoadPhoto.m
//  Errands_IOS
//
//  Created by 王硕 on 15/7/1.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import "NSNetUpLoadPhoto.h"
#import "NSNetWork.h"
@interface NSNetUpLoadPhoto(){

}
@end

@implementation NSNetUpLoadPhoto
- (NSData *)uploadRequestWithURL: (NSString *)url  // IN
                        postParams: (NSMutableDictionary *)postParams // IN
                        picFilePath: (NSString *)picFilePath  // IN
                        picFileName: (NSString *)picFileName  // IN
                        withData:(NSDictionary *)parameters;
{
    
    NSString *TWITTERFON_FORM_BOUNDARY = @"AaB03x";
    url =[URL stringByAppendingString:url];
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
    
    if(picFilePath){
        
        UIImage *image=[UIImage imageWithContentsOfFile:picFilePath];
        //UIImage *image = [UIImage imageNamed:@"location_fall"];
        UIImage *newImg=[self imageWithImageSimple:image scaledToSize:CGSizeMake(200, 200)];
        //判断图片是不是png格式的文件
        if (UIImagePNGRepresentation(newImg)) {
            //返回为png图像。
            data = UIImagePNGRepresentation(newImg);
        }else {
            //返回为JPEG图像。
            data = UIImageJPEGRepresentation(newImg, 1.0);
        }
    }
    
    //http body的字符串
    NSMutableString *body=[[NSMutableString alloc]init];
    
    //参数的集合的所有key的集合
    NSArray *keys= [postParams allKeys];
    
    //遍历keys
    for(int i=0;i<[keys count];i++)
    {
        //得到当前key
        NSString *key=[keys objectAtIndex:i];
        
        //添加分界线，换行
        [body appendFormat:@"%@\r\n",MPboundary];
        //添加字段名称，换2行
        [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key];
        //添加字段的值
        [body appendFormat:@"%@\r\n",[postParams objectForKey:key]];
        
       // NSLog(@"添加字段的值==%@",[postParams objectForKey:key]);
    }
    [body appendFormat:@"%@\r\n",MPboundary];
    
    NSString *str = [self withgeturl:@"" withdata:parameters];
    [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n",@"inputParameter"];
    [body appendFormat:@"Content-Type:application/json\r\n\r\n%@\r\n",str];
    
    if(picFilePath){
        ////添加分界线，换行
        [body appendFormat:@"%@\r\n",MPboundary];
        
        //声明pic字段，文件名为boris.png
        [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",@"inputFile",picFileName];
        
        //声明上传文件的格式
        [body appendFormat:@"Content-Type: image/jpge,image/gif, image/jpeg, image/pjpeg, image/pjpeg\r\n\r\n"];
        
    }
    //声明结束符：--AaB03x--
    NSString *end=[[NSString alloc]initWithFormat:@"\r\n%@",endMPboundary];
    //声明myRequestData，用来放入http body
    NSMutableData *myRequestData=[NSMutableData data];
    
    //将body字符串转化为UTF8格式的二进制
    [myRequestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
    if(picFilePath){
        //将image的data加入
        [myRequestData appendData:data];
    }
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
    NSData* resultData;
    // --- test  for crash
    if (request) {
        resultData = [NSURLConnection sendSynchronousRequest:request   returningResponse:&urlResponese error:&error];
    }else{
        return Nil;
    }
   // NSString* result;
    if (resultData) {
    NSString* result= [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    return resultData;
    }
    return nil;
}
- (UIImage *) imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize) newSize{
    newSize.height=image.size.height*(newSize.width/image.size.width);
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  newImage;
}
- (NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName{
    NSData* imageData;
    //判断图片是不是png格式的文件
    if (UIImagePNGRepresentation(tempImage)) {
        //返回为png图像。
        imageData = UIImagePNGRepresentation(tempImage);
    }else {
        //返回为JPEG图像。
        imageData = UIImageJPEGRepresentation(tempImage, 1.0);
    }
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSString* documentsDirectory = [paths objectAtIndex:0];
    
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    NSArray *nameAry=[fullPathToFile componentsSeparatedByString:@"/"];
  //  NSLog(@"===fullPathToFile===%@",fullPathToFile);
  //  NSLog(@"===FileName===%@",[nameAry objectAtIndex:[nameAry count]-1]);
    
    [imageData writeToFile:fullPathToFile atomically:NO];
    //path = fullPathToFile;
    return fullPathToFile;
}
-(NSString*)withgeturl:(NSString *)url withdata:(NSDictionary*)dic{
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
    NSString *url1 = [url stringByAppendingString:sendStr];
    return url1;
}

+ (NSNetUpLoadPhoto*)Instance
{
    static NSNetUpLoadPhoto *obj = nil;
    @synchronized([NSNetUpLoadPhoto class])
    {
        if (obj == nil)
        {
            obj = [[NSNetUpLoadPhoto alloc] init];
        }
    }
    return obj;
}

@end
