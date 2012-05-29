//
//  SynchronizedContactsConnection.m
//  People
//
//  Created by DCC UFRJ on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DownloadAgendaConnectionTests.h"
#import <OCMock/OCMock.h>

@implementation DownloadAgendaConnectionTests

- (void)setUp
{
    [super setUp];
    
    connection = [[DownloadAgendaConnection alloc] init];
}

- (void)tearDown
{   
    [connection release];

    [super tearDown];
}

- (void)testClassExists
{
    id object = NSClassFromString(@"DownloadAgendaConnection");
    STAssertNotNil(object, @"The Class DownloadAgendaConnection doesn't exists!");
}

- (void)testUrl
{
    connection.email = @"email@example.com";
    NSString *url = connection.url;
    STAssertEqualObjects(url, @"localhost:8000/api/download_agenda/email@example.com", @"The url doesn't match the expected value (localhost:8000/api/download_agenda/email@example.com).");
}

- (void)testConnectionSuccessful
{
    connection.email = @"email@example.com";
    [connection start];
}

@end
