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

- (NSString *)url
{
    return [NSString stringWithFormat:@"localhost:8000/api/download_agenda/%@", email];
}

- (void)start
{
    
}

#pragma mark -

- (void)dealloc {
    
    [url release];
    
    [super dealloc];
}

@end
