//
//  TKAddressBook.h
//  Errands_IOS
//
//  Created by 王硕 on 15/5/25.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TKAddressBook : NSObject {
    NSInteger sectionNumber;
    NSInteger recordID;
    NSString *name;
    NSString *email;
    NSString *tel;
}
@property NSInteger sectionNumber;
@property NSInteger recordID;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *tel;

@end
