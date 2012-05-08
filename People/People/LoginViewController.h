//
//  ViewController.h
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
{
    
    UITextField *txtLogin;
}

@property (nonatomic, retain) IBOutlet UITextField *txtLogin;

- (IBAction)login;

@end
