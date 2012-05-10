//
//  SynchronizedContactsConnection.h
//  People
//
//  Created by DCC UFRJ on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SynchronizedContactsConnection : NSObject
{
    NSString *url;
    NSString *email;
}

@property (nonatomic, readonly) NSString *url;
@property (nonatomic, copy) NSString *email;

- (BOOL)start:(NSError **)error;

@end
