//
//  SynchronizedContactsConnection.h
//  People
//
//  Created by DCC UFRJ on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "ConnectionDelegate.h"

@interface DownloadAgendaConnection : NSObject
{
    id <ConnectionDelegate> delegate;
    
    NSObject *response;
    NSString *url;
    NSString *email;
    
    AFJSONRequestOperation *jsonRequest;
}

@property (nonatomic, readonly) NSString *url;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, retain) NSObject *response;
@property (nonatomic, assign) id <ConnectionDelegate> delegate;

- (id)initWithEmail:(NSString *)email andDelegate:(id<ConnectionDelegate>)delegate;
- (void)startConnection;

@end
