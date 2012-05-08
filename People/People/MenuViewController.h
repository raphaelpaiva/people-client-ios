//
//  MenuViewController.h
//  People
//
//  Created by DCC UFRJ on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSString *email;
    UILabel *lblEmail;
    NSArray *listaContatos;
}

@property (retain, nonatomic) IBOutlet UILabel *lblEmail;
@property (nonatomic, copy) NSString *email;

- (id)initWithEmail:(NSString *)_email;

@end
