//
//  PeopleUtilsTests.m
//  People
//
//  Created by DCC UFRJ on 02/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PeopleUtilsTests.h"
#import "PeopleUtils.h"

@implementation PeopleUtilsTests

- (void)testValidateEmail_ValidEmail
{
    BOOL result = [PeopleUtils validateEmail:@"test@example.com"];
    
    STAssertTrue(result, @"Result should be true.");
}

- (void)testValidateEmail_Empty
{
    BOOL result = [PeopleUtils validateEmail:@""];
    
    STAssertFalse(result, @"Result should be false.");
}

- (void)testValidateEmail_MalFormed
{
    BOOL result = [PeopleUtils validateEmail:@"abc"];
        
    STAssertFalse(result, @"Result should be false.");
}

- (void)testValidateAgenda_Empty
{
    NSArray *array = [[NSArray alloc] initWithObjects:nil];
    BOOL result = [PeopleUtils validateAgenda:array];
    
    STAssertFalse(result, @"Result should be false.");
}

- (void)testValidateAgenda_NotEmpty
{
    NSArray *array = [NSArray arrayWithObjects:@"Red", @"Green", @"Blue", @"Yellow", nil];
    BOOL result = [PeopleUtils validateAgenda:array];
    
    STAssertTrue(result, @"Result should be true.");
}

@end
