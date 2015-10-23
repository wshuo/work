//
//  NSSToastView.h
//  StatrWork
//
//  Created by w.shuo on 15-3-12.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSSToastDef.h"

@interface NSSToastView : UIView
{
    @private
    NSString *_text;
    NSInteger _fontNum;
    NSSToastTime _showTime;
    BOOL _isFristShow;
    NSTimer *_timer;
}
@property (nonatomic, strong) IBOutlet UILabel *showLabel;

- (void)setText:(NSString *)setText;
- (void)setShowDuringTime:(NSSToastTime)time;
- (void)setTextFount:(NSInteger)fount;
- (void)show;

@end
