//
//  MenuViewController.h
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadAgendaConnection.h"

@interface MenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, ConnectionDelegate>
{
    UILabel *lblEmail;
    UIImageView *imgBackground;
    UITableView *tableView;
    NSString *email;
    NSMutableArray *contactList;
    
    DownloadAgendaConnection *connection;
}

@property (retain, nonatomic) IBOutlet UILabel *lblEmail;
@property (retain, nonatomic) IBOutlet UIImageView *imgBackground;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UITextField *txtEmailDownloadContact;
@property (retain, nonatomic) IBOutlet UIButton *btnDownloadContacts;
@property (retain, nonatomic) IBOutlet UIButton *btnUploadContacts;
@property (nonatomic, retain) DownloadAgendaConnection *connection;
@property (nonatomic, copy) NSString *email;

- (id)initWithEmail:(NSString *)_email;
- (IBAction)onClickDownloadContacts;
- (IBAction)onClickUploadContacts;

@end
