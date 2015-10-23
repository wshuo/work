//
//  NSSToastView.m
//  StatrWork
//
//  Created by w.shuo on 15-3-12.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import "NSSToastView.h"

#define NSSTOAST_WITH       (20)
#define NSSTOAST_HIGHT      (15)
#define NSSTOASTHIGHT_TOP   (80)
#define NSSTOASTMAXWITH     (220)

@implementation NSSToastView

- (void)dealloc
{
    
}

- (void)willMoveToWindow:(UIWindow *)newWindow
{
    if (newWindow)
    {
        self.layer.cornerRadius = 5.0f;
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;
        self.backgroundColor = [UIColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:0.75f];
        self.showLabel.textColor = [UIColor whiteColor];
    }
}

- (void)initVal
{
    if (_fontNum == 0)
    {
        _fontNum = NSSTOASTFONT_DEF;
        self.showLabel.font = [UIFont systemFontOfSize:_fontNum];
    }
    if (_showTime == 0)
    {
        _showTime = NSSTOASTTIME_DEF;
    }
}

- (void)setShowDuringTime:(NSSToastTime)time
{
    _showTime = time;
}

- (void)setTextFount:(NSInteger)fount
{
    _fontNum = fount;
    self.showLabel.font = [UIFont systemFontOfSize:_fontNum];
}

- (void)setText:(NSString *)setText
{
    if (!_text)
    {
        _isFristShow = YES;
    }
    else
    {
        _isFristShow = NO;
    }
    if (setText)
    {
        _text = [[NSString alloc] initWithString:setText];
    }
}

-(void)dismissToast
{
    [self removeFromSuperview];
}

-(void)showAnimation
{
    self.alpha = 0.0f;
    [UIView beginAnimations:@"show" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    self.alpha = 1.0f;
    [UIView commitAnimations];
}

- (void)repeatAdimationDone
{
    [UIView beginAnimations:@"showRepeatDone" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.3];

    self.alpha = 1.0f;
    [UIView commitAnimations];
}

- (void)showRepeatAnimation
{
    
    [UIView beginAnimations:@"showRepeat" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self cache:YES];
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(repeatAdimationDone)];
    [UIView setAnimationDuration:0.3];
    self.alpha = 0.0f;
    [UIView commitAnimations];
}

-(void)hideAnimation
{
    [UIView beginAnimations:@"hide" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(dismissToast)];
    [UIView setAnimationDuration:0.3];
    self.alpha = 0.0f;
    [UIView commitAnimations];
}
- (CGSize)sizeWithStr:(NSString *)str font:(UIFont *)fount  constrainedToSize:(CGSize)size
{
    CGSize rltSize = CGSizeZero;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:fount, NSParagraphStyleAttributeName:paragraphStyle.copy};
    rltSize = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    return rltSize;
}

- (void)fillText:(NSString *)text
{
    CGSize size = [self sizeWithStr:text font:[UIFont systemFontOfSize:_fontNum] constrainedToSize:CGSizeMake(200, MAXFLOAT)];
    
    CGRect rectFrame = self.frame;
    rectFrame.size.height = size.height + NSSTOAST_HIGHT;
    self.frame = rectFrame;
    
    CGRect rect = self.frame;
    rect.size.width = size.width + NSSTOAST_WITH;
    self.frame = rect;
    
    self.showLabel.text = text;
    
    //UIWindow *win = [NSSWindowInterFace getMainWindow];
    UIWindow *window =  [UIApplication sharedApplication].keyWindow;
    CGPoint point = self.center;
    point.x = window.center.x;
    //point.y = NSSTOASTHIGHT_TOP;
    point.y =window.center.y;
    self.center = point;
}

- (void)show
{
    [self initVal];
    
    if (_timer)
    {
        [_timer invalidate];
    }
    _timer = [NSTimer timerWithTimeInterval:_showTime target:self selector:@selector(hideAnimation) userInfo:nil repeats:NO];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:_timer forMode:NSDefaultRunLoopMode];
    
    if (_isFristShow && _text)
    {
        [self fillText:_text];
        
         UIWindow *window =  [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
        //[NSSWindowInterFace addViewToWindow:self level:NSSWINDOWLEVEL_LEVEL4];
        [self showAnimation];
    }
    else
    {
        [self fillText:_text];
        [self showRepeatAnimation];
    }

}

#pragma mark - 代理
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hideAnimation];
}

@end
