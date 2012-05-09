//
//  AppDelegate.m
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "LoginViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    navigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [loginViewController release];

    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark -

- (void)dealloc
{
    [_window release];
    [navigationController release];
    
    [super dealloc];
}

@end
