//
//  ContactTests.m
//  People
//
//  Created by DCC UFRJ on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContactTests.h"
#import <Foundation/Foundation.h>

@implementation ContactTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{    
    [super tearDown];
}

- (void)testClassExists 
{
    id object = NSClassFromString(@"Contact");
    STAssertNotNil(object, @"The Class Contact doesn't exists!");
}

@end
