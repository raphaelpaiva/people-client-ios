//
//  ViewController.m
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "MenuViewController.h"
#import "PeopleUtils.h"

@implementation LoginViewController

@synthesize txtLogin;
@synthesize lblLogo;
@synthesize imgBackground;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.titleView = lblLogo;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_1.png"] forBarMetrics:UIBarMetricsDefault];
    imgBackground.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_2.png"]];
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
    BOOL isLoginValid = [PeopleUtils validateEmail:txtLogin.text];
    
    if (!isLoginValid) {
        [PeopleUtils showAlertViewWithMessage:MSG_INVALID_EMAIL];

        return;
    }
    
    MenuViewController *menuViewController = [[MenuViewController alloc] initWithEmail:txtLogin.text];
    
    [self.navigationController pushViewController:menuViewController animated:YES];
    
    [menuViewController release];
}

#pragma mark -

- (void)viewDidUnload
{
    self.lblLogo = nil;
    self.imgBackground = nil;
    self.txtLogin = nil;
    
   [super viewDidUnload];
}

- (void)dealloc
{    
    [lblLogo release];
    [imgBackground release];
    [txtLogin release];
    
    [super dealloc];
}

@end
