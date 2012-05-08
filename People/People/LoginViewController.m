//
//  ViewController.m
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "MenuViewController.h"

@implementation LoginViewController

@synthesize txtLogin;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"People";

    txtLogin.delegate = self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    [self login];
    
    return YES;
}

#pragma mark IBActions

- (IBAction)login
{
    MenuViewController *menuViewController = [[MenuViewController alloc] initWithEmail:txtLogin.text];
    
    [self.navigationController pushViewController:menuViewController animated:YES];
    
    [menuViewController release];
}

#pragma mark -

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.txtLogin = nil;
}

- (void)dealloc
{    
    [super dealloc];
    
    [txtLogin release];
}

@end
