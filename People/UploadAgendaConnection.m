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
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSLog(@"%@",  [AgendaManager contacts]);
    
    
    for (Contact *contact in [AgendaManager contacts]) {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:contact.name, @"nome", contact.telephone, @"telefone", nil];
        
        [array addObject:dict];
    }
    NSLog(@"%@", array);
    SBJsonWriter *writer = [[SBJsonWriter alloc] init];
    NSDictionary *dados = [NSDictionary dictionaryWithObjectsAndKeys:[writer stringWithObject:array], @"contatos", nil];
    NSLog(@"%@", dados);
    [array release];
    [writer release];
    
    httpClient = [[AFHTTPClient alloc] initWithBaseURL:
                            [NSURL URLWithString:self.url]];

    //Continuar, o que enviar?
    [httpClient postPath:self.url parameters:dados
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
