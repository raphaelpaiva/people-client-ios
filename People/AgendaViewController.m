//
//  ContactsViewController.m
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AgendaViewController.h"
#import "Contact.h"

@implementation AgendaViewController

@synthesize agenda;

- (id)initWithAgenda:(Agenda *)_agenda
{
    if (self = [super init])
    {
        self.agenda = _agenda;
    }
    
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    Contact *contact = [agenda.contacts objectAtIndex:indexPath.row];
    NSString *stringTel = [NSString stringWithFormat:@"tel:%@", contact.telephone];
    NSURL *phoneURL = [[NSURL alloc] initWithString:stringTel];
    BOOL teste = [[UIApplication sharedApplication] openURL:phoneURL];
    [phoneURL release];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return agenda.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellContato";
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (tableViewCell == nil) {
        
        tableViewCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];
        tableViewCell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    
    Contact *contact = [agenda.contacts objectAtIndex:indexPath.row];
    tableViewCell.textLabel.text = contact.name;
    tableViewCell.detailTextLabel.text = contact.telephone;
    
    return tableViewCell;
}

#pragma mark -

- (void)viewDidUnload
{   
    self.agenda = nil;
    
    [super viewDidUnload];
}

- (void)dealloc
{
    [agenda release];
    
    [super dealloc];
}

@end
