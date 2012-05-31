//
//  SynchronizedContactsConnection.h
//  People
//
//  Created by DCC UFRJ on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface DownloadAgendaConnection : NSObject
{
    NSString *url;
    NSString *email;
    
    AFJSONRequestOperation *jsonRequest;
}

@property (nonatomic, readonly) NSString *url;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, retain) AFJSONRequestOperation *jsonRequest;

- (id)initWithEmail:(NSString *)email;
- (void)startConnection;

@end
