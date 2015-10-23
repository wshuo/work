//
//  NSSGetPhone.h
//  Errands_IOS
//
//  Created by 王硕 on 15/5/25.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface NSSGetPhone : NSObject{
    ABAddressBookRef addressBooks;
}
- (NSMutableArray *)filterContentForSearchText;
- (BOOL)getaddrestart;
+ (NSSGetPhone*) Instance;
@end
//@interface TKAddressBook11 : NSObject {
//    NSInteger sectionNumber;
//    NSInteger recordID;
//    NSString *name;
//    NSString *email;
//    NSString *tel;
//}
//@property NSInteger sectionNumber;
//@property NSInteger recordID;
//@property (nonatomic, retain) NSString *name;
//@property (nonatomic, retain) NSString *email;
//@property (nonatomic, retain) NSString *tel;
//
//@end
//
//@implementation TKAddressBook11
//
//@synthesize sectionNumber,recordID,name,email,tel;
//
//@end