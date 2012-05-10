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

- (BOOL)start:(NSError **)error
{
    if (email == nil)
    {
        NSMutableDictionary *details = [NSMutableDictionary dictionary];
        [details setValue:@"Email paramete should not be nil!" forKey:NSLocalizedDescriptionKey];
        *error = [NSError errorWithDomain:@"ConnectionError" code:200 userInfo:details];
        
        return NO;
    }
    
    return YES;
}

#pragma mark -

- (void)dealloc {
    
    [url release];
    
    [super dealloc];
}

@end
