//
//  AgendaManager.m
//  People
//
//  Created by Patrícia Borges on 02/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AgendaManager.h"
#import "Contact.h"

@implementation AgendaManager

#pragma mark Public Methods

+ (NSArray *)contacts
{
    NSMutableArray *contacts = [[NSMutableArray alloc] init];
    
    
    ABAddressBookRef addressBook = ABAddressBookCreate();
    CFArrayRef abAllPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBook);
    
    for (int i = 0; i < nPeople; i++)
    {
        
        ABRecordRef abPerson = CFArrayGetValueAtIndex(abAllPeople, i);
      
        ABMultiValueRef abPhones = (ABMultiValueRef)ABRecordCopyValue(abPerson, kABPersonPhoneProperty);
                        
        NSString *telephone = @"";
        
        for (int i = 0; i < ABMultiValueGetCount(abPhones); i++) {
                       
            CFTypeRef abMobileLabel = ABMultiValueCopyLabelAtIndex(abPhones, i);
            NSString* mobileLabel = [NSString stringWithUTF8String:abMobileLabel];
            CFRelease(abMobileLabel);
            
            if([mobileLabel isEqualToString:(NSString *)kABPersonPhoneMainLabel]) 
            {
                CFTypeRef cftelephone = ABMultiValueCopyValueAtIndex(abPhones, i);
                telephone = [NSString stringWithUTF8String:cftelephone];
                CFRelease(cftelephone);
                break;
            } 
        }

        CFRelease(abPhones);
        
        CFTypeRef cfname = ABRecordCopyValue(abPerson, kABPersonFirstNameProperty);
        NSString *name = [NSString stringWithUTF8String:cfname];
        CFRelease(cfname);
        
        Contact *contact = [[Contact alloc] initWithName:name telephone:telephone];
        [contacts addObject:contact];
        [contact release];
    }
    
    CFRelease(abAllPeople);
    CFRelease(addressBook);
    
    return [contacts autorelease];
}

@end
