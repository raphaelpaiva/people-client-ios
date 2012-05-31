//
//  ConnectionDelegate.h
//  People
//
//  Created by DCC UFRJ on 31/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DownloadAgendaConnection;

@protocol ConnectionDelegate

- (void)connectionSuccessful:(DownloadAgendaConnection *)connection;
- (void)connectionFail:(DownloadAgendaConnection *)connection;

@end
