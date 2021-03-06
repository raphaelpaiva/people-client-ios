//
//  PeopleUtils.m
//  People
//
//  Created by DCC UFRJ on 02/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PeopleUtils.h"

@implementation PeopleUtils

+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];

    BOOL isValid = [emailTest evaluateWithObject:email];
    
    if(isValid)
        return YES;  
    else
        return NO;
}

+ (void)showAlertViewWithMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"People" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertView show];
    [alertView release];
}


+ (BOOL)validateAgenda:(NSArray *)array
{
    int count = [array count];
    BOOL isValid = count > 0;
    
    if(isValid)
        return YES;  
    else
        return NO;
}


@end
