//
//  SynchronizedContactsConnection.m
//  People
//
//  Created by DCC UFRJ on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DownloadAgendaConnection.h"

@interface DownloadAgendaConnection (Private)

- (NSArray *)connectionSuccessful:(id)json;

@end

@implementation DownloadAgendaConnection

@synthesize email;
@synthesize jsonRequest;
@synthesize delegate;
@synthesize response;

- (id)initWithEmail:(NSString *)_email andDelegate:(id<ConnectionDelegate>)_delegate
{   
    if (self = [super init])
    {
        self.email = _email;
        self.delegate = _delegate;
    } 
    
    return self;
}

- (NSString *)url
{
    return [NSString stringWithFormat:@"http://localhost:8000/api/download_agenda/%@", email];
}

- (void)startConnection
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self url]]];
    
    void (^successBlock)(NSURLRequest *, NSHTTPURLResponse *, id);
    void (^errorBlock)(NSURLRequest *, NSHTTPURLResponse *, NSError *, id);
    
    successBlock = ^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
    {
        self.response = JSON;
        [delegate connectionSuccessful:self];
    };
    
    errorBlock = ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
    {
        self.response = error;
        [delegate connectionFail:self];
    };    
    
    jsonRequest = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:successBlock failure:errorBlock];
    [jsonRequest start];
}

#pragma mark -

- (void)dealloc {
    
    [url release];
    [jsonRequest release];
    
    [super dealloc];
}

@end
