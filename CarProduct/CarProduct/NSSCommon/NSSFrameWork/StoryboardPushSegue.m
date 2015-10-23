//
//  StoryboardPushSegue.m
//  Errands_IOS
//
//  Created by 王硕 on 15/5/20.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import "StoryboardPushSegue.h"
#import "BaseViewController.h"
//#import "firstViewController.h"
@interface StoryboardPushSegue(){
@private
    NSString *_NSSIdentifier;
    BaseViewController *_NSSFDistController;
}

@end
@implementation StoryboardPushSegue
- (instancetype)initWithIdentifier:(NSString *)identifier source:(BaseViewController *)source destination:(BaseViewController *)destination
{
    //    [super initWithIdentifier:identifier source:source destination:destination];
    UIStoryboard *secondStoryBoard = [UIStoryboard storyboardWithName:identifier bundle:nil];
    
    BaseViewController *con= nil;
    con= [secondStoryBoard instantiateViewControllerWithIdentifier:NSStringFromClass([destination class])];
    _NSSIdentifier = identifier;
    _NSSFDistController = con;
    [(BaseViewController *)source doPreForSegue:self];
    return [super initWithIdentifier:identifier source:source destination:destination];
}
- (void)perform {
    UINavigationController *ctrl = [self.sourceViewController navigationController];
    [ctrl pushViewController:_NSSFDistController animated:YES];
}
- (id)destinationViewController
{
    return _NSSFDistController;
}
- (NSString *)identifier
{
    return _NSSIdentifier;
}
@end
