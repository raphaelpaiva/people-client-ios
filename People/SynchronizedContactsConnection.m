//
//  SynchronizedContactsConnection.m
//  People
//
//  Created by DCC UFRJ on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SynchronizedContactsConnection.h"

@implementation SynchronizedContactsConnection

@synthesize email;

- (NSString *)url
{
    return [NSString stringWithFormat:@"localhost:8000/api/sincronizar/%@", email];
}

- (void)start:(NSError **)error
{
    if (email == nil)
    {
        NSMutableDictionary *details = [NSMutableDictionary dictionary];
        [details setValue:@"Email parameter should not be nil!" forKey:NSLocalizedDescriptionKey];
        *error = [NSError errorWithDomain:@"ConnectionError" code:201 userInfo:details];
    }

    
}

#pragma mark -

- (void)dealloc {
    
    [url release];
    
    [super dealloc];
}

@end
