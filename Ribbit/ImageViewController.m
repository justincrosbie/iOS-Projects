//
//  ImageViewController.m
//  Ribbit
//
//  Created by Justin Crosbie on 28/12/2013.
//  Copyright (c) 2013 Justin Crosbie. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    PFFile *imageFile = [self.message objectForKey:@"file"];
    NSURL *imageFileURL = [[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileURL];
    self.imageView.image = [UIImage imageWithData:imageData];
    
    NSString *senderName = [self.message objectForKey:@"senderName"];
    NSString *title = [NSString stringWithFormat:@"Sent from %@", senderName];
    self.navigationItem.title = title;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if ( [self respondsToSelector:@selector(timeout)] ) {
        [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(timeout) userInfo:nil repeats:NO];
    }
}

#pragma mark - Helper Methods

-(void) timeout {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
