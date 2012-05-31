//
//  MenuViewController.m
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuViewController.h"
#import "ContactsViewController.h"
#import "DownloadAgendaConnection.h"

@implementation MenuViewController

@synthesize lblEmail;
@synthesize imgBackground;
@synthesize tableView;
@synthesize txtEmailDownloadContact;
@synthesize btnDownloadContacts;
@synthesize btnUploadContacts;
@synthesize email;

- (id)initWithEmail:(NSString *)_email
{
    if (self = [super init])
    {
        self.email = _email;
    }
        
    return self;
}

- (void)retrieveDataFor:(NSString *)_userEmail
{
    contactList = [[NSMutableArray alloc] init];
}

#pragma mark IBActions

- (IBAction)onClickDownloadContacts
{    
    [UIView animateWithDuration:0.5 animations:^
    {
        int animationSize = 40;
        
        txtEmailDownloadContact.frame = CGRectMake(txtEmailDownloadContact.frame.origin.x, txtEmailDownloadContact.frame.origin.y + animationSize, txtEmailDownloadContact.frame.size.width, txtEmailDownloadContact.frame.size.height);
        
        btnUploadContacts.frame = CGRectMake(btnUploadContacts.frame.origin.x, btnUploadContacts.frame.origin.y + animationSize, btnUploadContacts.frame.size.width, btnUploadContacts.frame.size.height);
        
        tableView.frame = CGRectMake(tableView.frame.origin.x, tableView.frame.origin.y + animationSize, tableView.frame.size.width, tableView.frame.size.height - animationSize);
        
        [txtEmailDownloadContact becomeFirstResponder];
    }];
}

- (IBAction)onClickUploadContacts
{
    
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length != 0)
    {
        connection = [[DownloadAgendaConnection alloc] initWithEmail:textField.text andDelegate:self];
        [connection startConnection];
        
        [textField resignFirstResponder];
        
        return YES;
    }
    
    return NO;
}

#pragma mark ConnectionDelegate

- (void)connectionSuccessful:(DownloadAgendaConnection *)_connection 
{
    if ([_connection.response isKindOfClass:[NSArray class]])
    {
        [listaContatos addObject:txtEmailDownloadContact.text];
        [tableView reloadData];
        
//        NSArray *contatos = (NSArray *)_connection.response;
        
        
    }
}

- (void)connectionFail:(DownloadAgendaConnection *)connection 
{
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Menu";
    lblEmail.text = [NSString stringWithFormat:@"Olá %@,", email];
    imgBackground.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_2.png"]];
    
    [self retrieveDataFor:email];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContactsViewController *contactsViewController = [[ContactsViewController alloc] initWithEmail:email];
    
    [self.navigationController pushViewController:contactsViewController animated:YES];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return contactList.count;
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellContato";
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (tableViewCell == nil) {
        
        tableViewCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        tableViewCell.selectionStyle = UITableViewCellSelectionStyleGray;
        tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    tableViewCell.textLabel.text = [contactList objectAtIndex:indexPath.row];
    
    return tableViewCell;
}

#pragma mark -

- (void)viewDidUnload
{   
    self.lblEmail = nil;
    self.imgBackground = nil;
    self.tableView = nil;
    self.txtEmailDownloadContact = nil;
    self.btnUploadContacts = nil;
    self.btnDownloadContacts = nil;
    
    [super viewDidUnload];
}

- (void)dealloc
{    
    [lblEmail release];
    [contactList release];
    [imgBackground release];
    [tableView release];
    [connection release];
    [txtEmailDownloadContact release];
    [btnDownloadContacts release];
    [btnUploadContacts release];
    
    [super dealloc];
}
@end
