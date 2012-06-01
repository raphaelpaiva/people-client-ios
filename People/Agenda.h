//
//  Agenda.h
//  People
//
//  Created by Raphael Oliveira on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Agenda : NSObject
{
    NSString *email;
    NSArray *contacts;
}

@property (nonatomic, copy) NSString *email;
@property (nonatomic, retain) NSArray *contacts;

- (id)initWithEmail:(NSString *)email contacts:(NSArray *)contacts;

@end
