//
//  Agenda.m
//  People
//
//  Created by Raphael Oliveira on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Agenda.h"

@implementation Agenda

@synthesize email;
@synthesize contacts;

- (id)initWithEmail:(NSString *)_email contacts:(NSArray *)_contacts
{
    self = [super init];
    
    if (self)
    {
        self.email = _email;
        self.contacts = _contacts;
    }
    
    return self;
}

#pragma mark -

- (void)dealloc
{
    [email release];
    [contacts release];
    
    [super dealloc];
}

@end
