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

@interface MenuViewController (Private) 

- (void)shouldShowContactTextField:(BOOL)animate;

@end

@implementation MenuViewController

@synthesize lblEmail;
@synthesize imgBackground;
@synthesize tableView;
@synthesize txtEmailDownloadContact;
@synthesize btnDownloadContacts;
@synthesize btnUploadContacts;
@synthesize email;
@synthesize connection;

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
    if (btnDownloadContacts.tag == 0)
        btnDownloadContacts.tag = 1;
    else
        btnDownloadContacts.tag = 0;

    [self shouldShowContactTextField:btnDownloadContacts.tag];
}

- (IBAction)onClickUploadContacts
{
    
}

#pragma mark private

- (void)shouldShowContactTextField:(BOOL)animate 
{
    [UIView animateWithDuration:0.5 animations:^
    {
        int animationSize = 40;

        if (!animate)
        {
            animationSize = -animationSize;
            [txtEmailDownloadContact resignFirstResponder];
        } else
        {
            [txtEmailDownloadContact becomeFirstResponder];
        }

        txtEmailDownloadContact.frame = CGRectMake(txtEmailDownloadContact.frame.origin.x, txtEmailDownloadContact.frame.origin.y + animationSize, txtEmailDownloadContact.frame.size.width, txtEmailDownloadContact.frame.size.height);

        btnUploadContacts.frame = CGRectMake(btnUploadContacts.frame.origin.x, btnUploadContacts.frame.origin.y + animationSize, btnUploadContacts.frame.size.width, btnUploadContacts.frame.size.height);

        tableView.frame = CGRectMake(tableView.frame.origin.x, tableView.frame.origin.y + animationSize, tableView.frame.size.width, tableView.frame.size.height - animationSize);
        
    }];
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length != 0)
    {
        self.connection = [[[DownloadAgendaConnection alloc] initWithEmail:textField.text andDelegate:self] autorelease];
        [connection startConnection];
        
        [textField resignFirstResponder];
        
        [self shouldShowContactTextField:NO];
        btnDownloadContacts.tag = 0;
        
        return YES;
    }
    
    return NO;
}

#pragma mark ConnectionDelegate

- (void)connectionSuccessful:(DownloadAgendaConnection *)_connection 
{
    if ([_connection.response isKindOfClass:[NSArray class]])
    {
        NSArray *contatos = (NSArray *)_connection.response;
        
        NSDictionary *dicUser = [NSDictionary dictionaryWithObjectsAndKeys:contatos, txtEmailDownloadContact.text, nil];
        [contactList addObject:dicUser];
        [tableView reloadData];
        
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
    NSDictionary *userDic = (NSDictionary *)[contactList objectAtIndex:indexPath.row];
    NSString *_email = [[userDic allKeys] lastObject];
    NSArray *contacts = [[userDic allValues] lastObject];
    ContactsViewController *contactsViewController = [[ContactsViewController alloc] initWithEmail:_email andContacts:contacts];
    
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
    
    NSDictionary *contactDic = [contactList objectAtIndex:indexPath.row];
    tableViewCell.textLabel.text = [[contactDic allKeys] lastObject];
    
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
