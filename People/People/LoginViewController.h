//
//  ViewController.h
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>
{
    UITextField *txtLogin;
    UILabel *lblLogo;
    UIImageView *imgBackground;
}

@property (nonatomic, retain) IBOutlet UITextField *txtLogin;
@property (retain, nonatomic) IBOutlet UILabel *lblLogo;
@property (retain, nonatomic) IBOutlet UIImageView *imgBackground;

- (IBAction)login;

@end
