//
//  NSSGetPhone.m
//  Errands_IOS
//
//  Created by 王硕 on 15/5/25.
//  Copyright (c) 2015年 MYS. All rights reserved.
//

#import "NSSGetPhone.h"
#import "TKAddressBook.h"
@implementation NSSGetPhone

+ (NSSGetPhone*) Instance
{
    static NSSGetPhone *obj = nil;
    @synchronized([NSSGetPhone class])
    {
        if (obj == nil)
        {
            obj = [[NSSGetPhone alloc] init];
        }
        
    }
    return obj;
}
-(BOOL)getaddrestart{
    CFErrorRef error = NULL;
    addressBooks = nil;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
        
    {
        addressBooks =  ABAddressBookCreateWithOptions(NULL, NULL);
        
        //获取通讯录权限
        
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        
        ABAddressBookRequestAccessWithCompletion(addressBooks, ^(bool granted, CFErrorRef error){dispatch_semaphore_signal(sema);});
        
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        
        //dispatch_release(sema);
    }
    
    else
        
    {
        addressBooks = ABAddressBookCreate();
        
    }
    if (addressBooks==nil) {
        return NO ;
    }else{
        return YES;
    }
}

#pragma mark --读取所有联系人
- (NSMutableArray *)filterContentForSearchText
{
    NSMutableArray *addressBookTemp =[[NSMutableArray alloc]init];
    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBooks);
    
    //通讯录中人数
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBooks);
    
    //循环，获取每个人的个人信息
    for (NSInteger i = 0; i < nPeople; i++)
    {
        //新建一个addressBook model类
        TKAddressBook *addressBook1 = [[TKAddressBook alloc] init];
        //获取个人
        ABRecordRef person = CFArrayGetValueAtIndex(allPeople, i);
        //获取个人名字
        CFTypeRef abName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
        CFTypeRef abLastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
        CFStringRef abFullName = ABRecordCopyCompositeName(person);
        NSString *nameString = (__bridge NSString *)abName;
        NSString *lastNameString = (__bridge NSString *)abLastName;
        
        if ((__bridge id)abFullName != nil) {
            nameString = (__bridge NSString *)abFullName;
        } else {
            if ((__bridge id)abLastName != nil)
            {
                nameString = [NSString stringWithFormat:@"%@ %@", nameString, lastNameString];
            }
        }
        addressBook1.name = nameString;
        addressBook1.recordID = (int)ABRecordGetRecordID(person);;
        
        ABPropertyID multiProperties[] = {
            kABPersonPhoneProperty,
            kABPersonEmailProperty
        };
        NSInteger multiPropertiesTotal = sizeof(multiProperties) / sizeof(ABPropertyID);
        for (NSInteger j = 0; j < multiPropertiesTotal; j++) {
            ABPropertyID property = multiProperties[j];
            ABMultiValueRef valuesRef = ABRecordCopyValue(person, property);
            NSInteger valuesCount = 0;
            if (valuesRef != nil) valuesCount = ABMultiValueGetCount(valuesRef);
            
            if (valuesCount == 0) {
                CFRelease(valuesRef);
                continue;
            }
            //获取电话号码和email
            for (NSInteger k = 0; k < valuesCount; k++) {
                CFTypeRef value = ABMultiValueCopyValueAtIndex(valuesRef, k);
                switch (j) {
                    case 0: {// Phone number
                        addressBook1.tel = (__bridge NSString*)value;
                        break;
                    }
                    case 1: {// Email
                        addressBook1.email = (__bridge NSString*)value;
                        break;
                    }
                }
                CFRelease(value);
            }
            CFRelease(valuesRef);
        }
        //将个人信息添加到数组中，循环完成后addressBookTemp中包含所有联系人的信息
        [addressBookTemp addObject:addressBook1];
        
        if (abName) CFRelease(abName);
        if (abLastName) CFRelease(abLastName);
        if (abFullName) CFRelease(abFullName);
    }
    return addressBookTemp;
}

@end
