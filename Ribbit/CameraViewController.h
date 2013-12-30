//
//  CameraViewController.h
//  Ribbit
//
//  Created by Justin Crosbie on 27/12/2013.
//  Copyright (c) 2013 Justin Crosbie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CameraViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *videoFilePath;
@property (strong, nonatomic) PFRelation *friendsRelation;
@property (strong, nonatomic) NSArray *friends;
@property (strong, nonatomic) NSMutableArray *recipients;

- (IBAction)cancel:(id)sender;
- (IBAction)send:(id)sender;

-(void)uploadMessage;
-(UIImage *)resize:(UIImage *)image toWidth:(float)width andHeigth:(float)heigth;

@end
