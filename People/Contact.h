//
//  Contact.h
//  People
//
//  Created by DCC UFRJ on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject
{
    NSString *name;
    NSString *telephone;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *telephone;

- (id)initWithName:(NSString *)name telephone:(NSString *)telephone;

@end
