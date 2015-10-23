//
//  NSSToastInterFace.h
//  StatrWork
//
//  Created by w.shuo on 15-3-12.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSSToastDef.h"

@interface NSSToastInterFace : NSObject

+ (void)showToast:(NSString *)text;

@end
