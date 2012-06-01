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
    return [NSString stringWithFormat:@"http://localhost:8000/api/upload_agenda/%@", email];
}

#pragma mark Public

- (void)startConnection 
{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"(21) 1234-5678", @"telefone", @"lucas", @"nome", nil];
    NSArray *array = [[NSArray alloc] initWithObjects:dic, nil];
    
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:0 error:&error];
    
    httpClient = [[AFHTTPClient alloc] initWithBaseURL:
                            [NSURL URLWithString:self.url]];

    //Continuar, o que enviar?
    [httpClient postPath:self.url parameters:data 
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
