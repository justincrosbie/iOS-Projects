//
//  SigninViewController.h
//  Ribbit
//
//  Created by Justin Crosbie on 23/12/2013.
//  Copyright (c) 2013 Justin Crosbie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SigninViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)signin:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
