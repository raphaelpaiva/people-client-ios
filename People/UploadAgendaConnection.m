//
//  UploadAgendaConnection.m
//  People
//
//  Created by Raphael Oliveira on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UploadAgendaConnection.h"

@implementation UploadAgendaConnection

@synthesize email;

- (id)initWithEmail:(NSString *)_email
{
    self = [super init];
    
    if (self)
    {
        self.email = _email;
        
    }
    
    return self;
}

- (NSString *)url
{
    return [NSString stringWithFormat:@"http://192.168.192.198:8000/api/upload_agenda/%@", email];
}

#pragma mark Public

- (void)startConnection 
{
    NSDictionary *contato1 = [NSDictionary dictionaryWithObjectsAndKeys:@"(21) 1234-5678", @"telefone", @"lucas", @"nome", nil];
    NSDictionary *contato2 = [NSDictionary dictionaryWithObjectsAndKeys:@"(21) 8773-5678", @"telefone", @"pedro", @"nome", nil];

    NSArray *array = [[NSArray alloc] initWithObjects:contato1, contato2, nil];
        
    SBJsonWriter *writer = [[SBJsonWriter alloc] init];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[writer stringWithObject:array], @"contatos", nil];
    
    
    httpClient = [[AFHTTPClient alloc] initWithBaseURL:
                            [NSURL URLWithString:self.url]];

    //Continuar, o que enviar?
    [httpClient postPath:self.url parameters:dic
                 success:^(AFHTTPRequestOperation *operation, id responseObject)
                 {
                     NSString *text = [[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding] autorelease];
                     NSLog(@"Response: %@", text);
                 } 
                 failure:^(AFHTTPRequestOperation *operation, NSError *error)
                 {
                     NSLog(@"%@", [error localizedDescription]);
                 }];
}

#pragma mark -

- (void)dealloc
{
    [email release];
    [httpClient release];
    
    [super dealloc];
}

@end
