//
//  UploadAgendaConnection.m
//  People
//
//  Created by Raphael Oliveira on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UploadAgendaConnection.h"
#import "PeopleUtils.h"
#import "SVProgressHUD.h"

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
    return [NSString stringWithFormat:@"http://10.10.10.123:8000/api/upload_agenda/%@", email];
}

#pragma mark Public

- (void)startConnection 
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
 
    for (Contact *contact in [AgendaManager contacts]) {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:contact.name, @"nome", contact.telephone, @"telefone", nil];
        
        [array addObject:dict];
    }
    
    //validacao se possuem contatos...
    BOOL isAgendaValid = [PeopleUtils validateAgenda:array];
    
    if (isAgendaValid)
    {
      
        SBJsonWriter *writer = [[SBJsonWriter alloc] init];
        NSDictionary *dados = [NSDictionary dictionaryWithObjectsAndKeys:[writer stringWithObject:array], @"contatos", nil];
      
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
                         [SVProgressHUD dismiss];
                         [PeopleUtils showAlertViewWithMessage:MSG_SUCCESS_AGENDA];
                     } 
                     failure:^(AFHTTPRequestOperation *operation, NSError *error)
                     {
                         [SVProgressHUD dismissWithError:[error description]];
                         NSLog(@"%@", [error localizedDescription]);
                     }];
    }
    else
    {
        [PeopleUtils showAlertViewWithMessage:MSG_INVALID_AGENDA];
    }
}

#pragma mark -

- (void)dealloc
{
    [email release];
    [httpClient release];
    
    [super dealloc];
}

@end
