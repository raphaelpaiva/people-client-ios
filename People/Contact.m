//
//  Contact.m
//  People
//
//  Created by DCC UFRJ on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Contact.h"

@implementation Contact

@synthesize name;
@synthesize telephone;

- (id)initWithName:(NSString *)_name telephone:(NSString *)_telephone
{
    self = [super init];
    
    if (self)
    {
        self.name = _name;
        self.telephone = _telephone;
    }
    
    return self;
}

#pragma mark -

- (void)dealloc
{
    [name release];
    [telephone release];
    
    [super dealloc];
}

@end
