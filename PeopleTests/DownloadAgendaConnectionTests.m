//
//  SynchronizedContactsConnection.m
//  People
//
//  Created by DCC UFRJ on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DownloadAgendaConnectionTests.h"
#import <OCMock/OCMock.h>

@interface DownloadAgendaConnection (Private)

- (NSArray *)connectionSuccessful:(id)json;

@end

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
    STAssertEqualObjects(url, @"http://localhost:8000/api/download_agenda/email@example.com", @"The url doesn't match the expected value (localhost:8000/api/download_agenda/email@example.com)!");
}

- (void)testInitWithEmail
{
    NSString *email = @"email@example.com";
    DownloadAgendaConnection *downloadAgendaConnection = [[DownloadAgendaConnection alloc] initWithEmail:email andDelegate:nil];
    
    STAssertEqualObjects(email, downloadAgendaConnection.email, @"InitWithEmail didn't set the email field!");
    
    [downloadAgendaConnection release];
}

- (void)testStartCallsAFNetworkStart
{
    id partialMock = [OCMockObject partialMockForObject:connection];

    [[[partialMock expect] andCall:@selector(start) onObject:connection.jsonRequest] startConnection];
    
    [connection startConnection];
    
    [partialMock verify];
}

//- (void)testConnectionSuccessful
//{
//    NSDictionary *contato1 = [[[NSDictionary alloc] initWithObjectsAndKeys:@"(21) 9999-8888", @"telefone", @"Flavio", @"nome", nil] autorelease];
//    NSDictionary *contato2 = [[[NSDictionary alloc] initWithObjectsAndKeys:@"(21) 8888-7777", @"telefone", @"Assis", @"nome", nil] autorelease];
//    
//    NSArray *contatos = [NSArray arrayWithObjects:contato1, contato2, nil];
//    
//    
//    
////    id partialMock = [OCMockObject partialMockForObject:connection];
////    
////    [[partialMock expect] connectionSuccessful:nil];
////    
////    [connection startConnection];
////    
////    [partialMock verify];
//}

@end
