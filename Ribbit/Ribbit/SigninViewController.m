//
//  SigninViewController.m
//  Ribbit
//
//  Created by Justin Crosbie on 23/12/2013.
//  Copyright (c) 2013 Justin Crosbie. All rights reserved.
//

#import "SigninViewController.h"
#import <Parse/Parse.h>

@interface SigninViewController ()

@end

@implementation SigninViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.hidesBackButton = YES;
}

- (IBAction)signin:(id)sender {

    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ( [username length] == 0 || [password length] == 0 ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!!" message:@"Make sure you enter a username and password!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
    } else {
        [PFUser logInWithUsernameInBackground:username password:password
                                        block:^(PFUser *user, NSError *error) {
                                            if ( error ) {
                                                NSString *errorString = [error userInfo][@"error"];
                                                // Show the errorString somewhere and let the user try again.
                                                
                                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!!" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                
                                                [alertView show];
                                            } else {
                                                if (user) {
                                                    // Do stuff after successful login.
                                                } else {
                                                    // The login failed. Check error to see why.
                                                }
                                                
                                                [self.navigationController popToRootViewControllerAnimated:YES];
                                            }
                                        }];
    }
    
}

@end
