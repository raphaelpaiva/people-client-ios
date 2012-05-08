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

- (void)dealloc {
    
    [lblEmail release];
    
    [super dealloc];
}
@end
