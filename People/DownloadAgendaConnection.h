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
    id response;
    
    NSString *url;
    NSString *email;
    
    AFJSONRequestOperation *jsonRequest;
}

@property (nonatomic, readonly) NSString *url;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, retain) AFJSONRequestOperation *jsonRequest;
@property (nonatomic, assign) id <ConnectionDelegate> delegate;
@property (nonatomic, assign) id response;

- (id)initWithEmail:(NSString *)email andDelegate:(id<ConnectionDelegate>)delegate;
- (void)startConnection;

@end
