//
//  ContactsViewController.h
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Agenda.h"

@interface AgendaViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    Agenda *agenda;
}

@property (nonatomic, retain) Agenda *agenda;

- (id)initWithAgenda:(Agenda *)agenda;

@end
