//
//  MenuViewController.m
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuViewController.h"
#import "AgendaViewController.h"
#import "Agenda.h"
#import "SVProgressHUD.h"
#import "PeopleUtils.h"

@interface MenuViewController (Private) 

- (void)shouldShowEmailTextField:(BOOL)show;

@end

@implementation MenuViewController

@synthesize lblEmail;
@synthesize imgBackground;
@synthesize tableView;
@synthesize txtEmailDownloadContact;
@synthesize btnDownloadContacts;
@synthesize btnUploadContacts;
@synthesize email;
@synthesize downloadAgendaConnection;
@synthesize uploadAgendaConnection;
@synthesize agendas;

- (id)initWithEmail:(NSString *)_email
{
    if (self = [super init])
    {
        self.email = _email;
    }
        
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Menu";
    
    emailTextFieldHidden = YES;
    lblEmail.text = [NSString stringWithFormat:@"Olá %@,", email];
    imgBackground.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_2.png"]];
    agendas = [[NSMutableArray alloc] init];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark IBActions

- (IBAction)onClickDownloadAgenda
{    
    emailTextFieldHidden = !emailTextFieldHidden;
    [self shouldShowEmailTextField:!emailTextFieldHidden];
}

- (IBAction)onClickUploadAgenda
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"People" message:@"Você tem certeza que deseja disponibilizar os seus contatos?" delegate:self cancelButtonTitle:@"Não" otherButtonTitles:@"Sim", nil];
    
    [alertView show];
    [alertView release];
}

#pragma mark private

- (void)shouldShowEmailTextField:(BOOL)show 
{
    [UIView animateWithDuration:0.5 animations:^
    {
        int animationOffset = 40;

        if (show)
        {
            [txtEmailDownloadContact becomeFirstResponder];
        } else
        {
            animationOffset = -animationOffset;
            [txtEmailDownloadContact resignFirstResponder];
        }

        txtEmailDownloadContact.frame = CGRectMake(txtEmailDownloadContact.frame.origin.x, txtEmailDownloadContact.frame.origin.y + animationOffset, txtEmailDownloadContact.frame.size.width, txtEmailDownloadContact.frame.size.height);

        btnUploadContacts.frame = CGRectMake(btnUploadContacts.frame.origin.x, btnUploadContacts.frame.origin.y + animationOffset, btnUploadContacts.frame.size.width, btnUploadContacts.frame.size.height);

        tableView.frame = CGRectMake(tableView.frame.origin.x, tableView.frame.origin.y + animationOffset, tableView.frame.size.width, tableView.frame.size.height - animationOffset);
    }];
}

#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        self.uploadAgendaConnection = [[[UploadAgendaConnection alloc] initWithEmail:self.email] autorelease];
        [uploadAgendaConnection startConnection];
    }
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL isEmailValid = [PeopleUtils validateEmail:textField.text];
    
    if (isEmailValid)
    {
        [SVProgressHUD showWithStatus:@"Carregando..." maskType:SVProgressHUDMaskTypeGradient];
        
        self.downloadAgendaConnection = [[[DownloadAgendaConnection alloc] initWithEmail:textField.text andDelegate:self] autorelease];
        [downloadAgendaConnection startConnection];
        
        textField.text = @"";
        [textField resignFirstResponder];
        
        [self shouldShowEmailTextField:NO];
        emailTextFieldHidden = YES;
        
        return YES;
    }
    else
    {
        [PeopleUtils showAlertViewWithMessage:MSG_INVALID_EMAIL];
    }
    
    return NO;
}

#pragma mark ConnectionDelegate

- (void)connectionSuccessful:(DownloadAgendaConnection *)_connection 
{
    if (_connection.response != nil)
    {
        Agenda *agendasFromServer = (Agenda *) _connection.response;
        
        if (agendasFromServer.contacts.count == 0)
        {
            [SVProgressHUD dismissWithError:@"A agenda selecionada está vazia."];
        }
        else
        {
            [agendas addObject:_connection.response];
            [tableView reloadData];
            [SVProgressHUD dismissWithSuccess:@""];  
        }
    }
}

- (void)connectionFail:(DownloadAgendaConnection *)_connection 
{
    NSError *error = (NSError *)_connection.response;
    
    if (error.code == PAGE_NOT_FOUND_404)
    {
        [SVProgressHUD dismissWithError:@"E-mail não encontrado!"];
    }    
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Agenda *agenda = [agendas objectAtIndex:indexPath.row];
    
    AgendaViewController *contactsViewController = [[AgendaViewController alloc] initWithAgenda:agenda];
    
    [self.navigationController pushViewController:contactsViewController animated:YES];
    
    [contactsViewController release];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return agendas.count;
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellContato";
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (tableViewCell == nil) {
        
        tableViewCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    Agenda *agenda = [agendas objectAtIndex:indexPath.row];
    
    tableViewCell.textLabel.text = agenda.email;
    
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
    [agendas release];
    [imgBackground release];
    [tableView release];
    [downloadAgendaConnection release];
    [uploadAgendaConnection release];
    [txtEmailDownloadContact release];
    [btnDownloadContacts release];
    [btnUploadContacts release];
    
    [super dealloc];
}
@end
