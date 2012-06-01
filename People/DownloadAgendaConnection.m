//
//  SynchronizedContactsConnection.m
//  People
//
//  Created by DCC UFRJ on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DownloadAgendaConnection.h"
#import "Agenda.h"
#import "Contact.h"

@interface DownloadAgendaConnection (Private)

- (void)parseJson:(id)json;

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

#pragma mark Public

- (void)startConnection
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self url]]];
    
    jsonRequest = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, id json)
                   {
                       [self parseJson:json];
                   } 
                   failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id json)
                   {
                       self.response = error;
                       [delegate connectionFail:self];
                   }];
    
    [jsonRequest start];
}

#pragma mark Private

- (void)parseJson:(id)json
{
    if ([json isKindOfClass:[NSArray class]])
    {
        NSMutableArray *contacts = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dicContact in json)
        {
            NSString *name = [dicContact objectForKey:@"nome"];
            NSString *telephone = [dicContact objectForKey:@"telefone"];
            
            Contact *contact = [[Contact alloc] initWithName:name telephone:telephone];
            [contacts addObject:contact];
            [contact release];
        }
        
        Agenda *agenda = [[Agenda alloc] initWithEmail:self.email contacts:contacts];
        self.response = agenda;
        [contacts release];
        [agenda release];
        
    } else
    {
        self.response = nil;
    }
    
    [delegate connectionSuccessful:self];
}

#pragma mark -

- (void)dealloc
{   
    [url release];
    
    [super dealloc];
}

@end
