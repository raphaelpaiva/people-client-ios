//
//  MenuViewController.m
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuViewController.h"

@implementation MenuViewController

@synthesize lblEmail;
@synthesize email;

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
    lblEmail.text = [NSString stringWithFormat:@"Olá, %@", email];
    self.title = @"contatos";
    
    listaContatos = [NSArray arrayWithObjects:@"flavio", @"macoli", @"ruivo", nil];
    [listaContatos retain];
}

- (void)viewDidUnload
{   
    [super viewDidUnload];

    self.lblEmail = nil;
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
    NSLog(@"selecionei o: %@", [listaContatos objectAtIndex:indexPath.row]);
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return listaContatos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellContato";
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (tableViewCell == nil) {
        
        tableViewCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        tableViewCell.selectionStyle = UITableViewCellSelectionStyleGray;
        tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    tableViewCell.textLabel.text = [listaContatos objectAtIndex:indexPath.row];
    
    return tableViewCell;
}

#pragma mark -

- (void)dealloc {
    
    [lblEmail release];
    [listaContatos release];
    [super dealloc];
}
@end
