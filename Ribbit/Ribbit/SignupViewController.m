//
//  SignupViewController.m
//  Ribbit
//
//  Created by Justin Crosbie on 23/12/2013.
//  Copyright (c) 2013 Justin Crosbie. All rights reserved.
//

#import "SignupViewController.h"
#import <Parse/Parse.h>

@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if ( [UIScreen mainScreen].bounds.size.height == 568 ) {
        self.backgroundImageView.image = [UIImage imageNamed:@"loginBackground-568h"];
    }

    self.usernameField.delegate = self;
    self.passwordField.delegate = self;
    self.emailField.delegate = self;
}

- (IBAction)signup:(id)sender {
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ( [username length] == 0 || [password length] == 0 || [email length] == 0 ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!!" message:@"Make sure you enter a username, password, and email address field!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
    } else {
        PFUser *user = [PFUser user];
        user.username = username;
        user.password = password;
        user.email = email;

        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                // Hooray! Let them use the app now.
                [self.navigationController popToRootViewControllerAnimated:YES];
            } else {
                NSString *errorString = [error userInfo][@"error"];
                // Show the errorString somewhere and let the user try again.

                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!!" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alertView show];
            }
        }];
    }
    
}

- (IBAction)dismiss:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITExtFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

@end
