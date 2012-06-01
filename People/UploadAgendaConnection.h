//
//  UploadAgendaConnection.h
//  People
//
//  Created by Raphael Oliveira on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface UploadAgendaConnection : NSObject
{
    NSString *email;
    NSString *url;
    
    AFHTTPClient *httpClient;
}

@property (nonatomic, readonly) NSString *url;
@property (nonatomic, copy) NSString *email;

- (id)initWithEmail:(NSString *)email;
- (void)startConnection;


@end
