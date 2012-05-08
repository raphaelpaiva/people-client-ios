//
//  ContactsViewController.h
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSString *email;
    NSArray *contacts;
}
@property (nonatomic, copy) NSString *email;
@property (nonatomic, retain) NSArray *contacts;

- (id)initWithEmail:(NSString *)_email;

@end
