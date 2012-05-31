//
//  SynchronizedContactsConnection.m
//  People
//
//  Created by DCC UFRJ on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DownloadAgendaConnection.h"

@implementation DownloadAgendaConnection

@synthesize email;
@synthesize jsonRequest;

- (id)initWithEmail:(NSString *)_email {
    
    if (self = [super init])
    {
        self.email = _email;
    } 
    
    return self;
}

- (NSString *)url
{
    return [NSString stringWithFormat:@"localhost:8000/api/download_agenda/%@", email];
}

- (void)startConnection
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self url]]];
    
    void (^ successBlock)(NSURLRequest *, NSHTTPURLResponse *, id);
    
    successBlock = ^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
    {
        NSLog(@"Public Timeline: %@", JSON);
    };
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:successBlock failure:nil];
    [operation start];
    
    
    [jsonRequest start];
    
    [self connectionSuccessful:@""];
}

- (NSArray *)connectionSuccessful:(NSString *)json
{
    return nil;
}

#pragma mark -

- (void)dealloc {
    
    [url release];
    [jsonRequest release];
    
    [super dealloc];
}

@end
