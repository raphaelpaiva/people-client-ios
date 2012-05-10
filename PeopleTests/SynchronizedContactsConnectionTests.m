//
//  SynchronizedContactsConnection.m
//  People
//
//  Created by DCC UFRJ on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SynchronizedContactsConnectionTests.h"

@implementation SynchronizedContactsConnectionTests

- (void)setUp
{
    [super setUp];
    
    connection = [[SynchronizedContactsConnection alloc] init];
}

- (void)tearDown
{   
    [connection release];

    [super tearDown];
}

- (void)testClassExists
{
    id object = NSClassFromString(@"SynchronizedContactsConnection");
    STAssertNotNil(object, @"The Class Contact doesn't exists!");
}

- (void)testUrl
{
    connection.email = @"email@example.com";
    NSString *url = connection.url;
    STAssertEqualObjects(url, @"localhost:8000/api/sincronizar/email@example.com", @"The url doesn't match the expected value (localhost:8000/api).");
}

- (void)testEmailParameterNil
{
    NSError *error;
    [connection start:&error];
    STAssertNotNil(error, @"Nil email parameter needs to return an error.");
}



@end
