//
//  LoadingViewManager.m
//  Errands_IOS
//
//  Created by 王硕 on 15/6/9.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import "LoadingViewManager.h"
#import "NSSLoadingView.h"

@interface LoadingViewManager(){
    NSSLoadingView *_LoadingView;
    NSMutableArray *array;
    NSLock *_arraylock;
    NSLock *_lock;
}
@end
@implementation LoadingViewManager
@synthesize loadDelegate;
+ (LoadingViewManager*)Instance
{
    static LoadingViewManager *obj = nil;
    @synchronized([LoadingViewManager class])
    {
        if (obj == nil)
        {
            obj = [[LoadingViewManager alloc] init];
        }
        
    }
    return obj;
}
- (instancetype)init
{
    id obj = [super init];
    
    if (obj)
    {
        _arraylock = [[NSLock alloc]init];
        [_arraylock setName:@"TASKPOOLLOCK"];
        _lock = [[NSLock alloc]init];
        [_lock setName:@"TASKPOOLLOCK"];
        array = [[NSMutableArray alloc]init];
    }
    
    return obj;
}

-(void)AddLoadingNamed:(NSString *)name delegate:(__weak id<NSSLoadProtocol>)delegate{
    [_arraylock lock];
    
    if(![array containsObject:name]){
        NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:@"NSSLoadingView" owner:self options:nil]; //通过这个方法,取得我们的视图
        _LoadingView = [nibViews objectAtIndex:0];
        _LoadingView.nameID = name;
        _LoadingView.delegate = delegate;
        UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
        _LoadingView.frame = CGRectMake(0, 0, keywindow.frame.size.width, keywindow.frame.size.height);
        [keywindow addSubview:_LoadingView];
        [array addObject:name];
    }
    [_arraylock unlock];
}
-(void)removewLoadingNamed:(NSString *)name delegate:(__weak id<NSSLoadProtocol>)delegate{
    [_lock lock];
    if([array containsObject:name]){
        [array removeObject:name];
    }
    if ([name isEqualToString:@"1"]) {
        array = [[NSMutableArray alloc]init];
    }
    [_LoadingView removeFromSuperview];
    [_lock unlock];
}
@end
