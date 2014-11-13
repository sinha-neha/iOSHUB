//
//  ViewController.m
//  InstragramSample
//
//  Created by Neha Sinha on 31/12/13.
//  Copyright (c) 2013 Mindfire Solutions. All rights reserved.
//

#import "SignInViewController.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -- View Controller life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	self.title = @"Welcome";
	[self logout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) dealloc
{
    [super dealloc];
}

#pragma mark -- Action for login button

- (IBAction) logInwithInstagram:(id)sender
{
    SignInViewController* signInViewC = [[SignInViewController alloc] initWithNibName:@"SignInView" bundle:nil];
    [self.navigationController pushViewController:signInViewC animated:YES];
}

- (void) logout
{
    NSHTTPCookieStorage* cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray* instagramCookies = [cookies cookiesForURL:[NSURL URLWithString:@"https://instagram.com/"]];

    for (NSHTTPCookie* cookie in instagramCookies)
    {
        [cookies deleteCookie:cookie];
    }
}

@end
