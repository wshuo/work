//
//  NSSToastDef.h
//  StatrWork
//
//  Created by w.shuo on 15-3-12.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, NSSToastTime)
{
    NSSTOASTTIME_DEF = 2,
    NSSTOASTTIME_SOON = 1,
    NSSTOASTTIME_LONGLEVEL1 = 3,
    NSSTOASTTIME_LONGLEVEL2 = 4,
};

typedef NS_ENUM(NSUInteger, NSSToastFont)
{
    NSSTOASTFONT_DEF = 17,
    NSSTOASTFONT_LEVEL1 = 14,
    NSSTOASTFONT_LEVEL2 = 16,
    NSSTOASTFONT_LEVEL3 = 18,
};