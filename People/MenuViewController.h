//
//  MenuViewController.h
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UILabel *lblEmail;
    UIImageView *imgBackground;
    UITableView *tableView;
    NSString *email;
    NSArray *listaContatos;
}

@property (retain, nonatomic) IBOutlet UILabel *lblEmail;
@property (retain, nonatomic) IBOutlet UIImageView *imgBackground;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSString *email;

- (id)initWithEmail:(NSString *)_email;
- (IBAction)onClickDownloadContacts;
- (IBAction)onClickUploadContacts;

@end
