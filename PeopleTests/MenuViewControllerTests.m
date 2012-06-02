//
//  MenuViewControllerTests.m
//  People
//
//  Created by DCC UFRJ on 02/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuViewControllerTests.h"
#import "MenuViewController.h"
#import "Agenda.h"

@implementation MenuViewControllerTests

- (void)testConnectionSuccessful_EmptyAgenda
{
    MenuViewController *menuViewController = [[MenuViewController alloc] initWithEmail:@"a@a.com"];
    
    DownloadAgendaConnection *connection = [[DownloadAgendaConnection alloc] init];
    
    NSArray *contacts = [[NSArray alloc] init];
    
    connection.response = [[Agenda alloc] initWithEmail:@"b@b.com" contacts:contacts];
    
    [menuViewController connectionSuccessful:connection];

    BOOL isAgendasSizeZero = menuViewController.agendas.count == 0;
    
    STAssertTrue(isAgendasSizeZero, @"Agendas size should be zero.");
}


@end
