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
}

#pragma mark -

- (void)dealloc
{
    [email release];
    [httpClient release];
    
    [super dealloc];
}

@end
