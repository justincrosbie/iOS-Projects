//
//  ImageViewController.h
//  Ribbit
//
//  Created by Justin Crosbie on 28/12/2013.
//  Copyright (c) 2013 Justin Crosbie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ImageViewController : UIViewController

@property (nonatomic, strong) PFObject *message;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
