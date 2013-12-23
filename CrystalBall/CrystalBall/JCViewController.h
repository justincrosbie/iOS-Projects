//
//  JCViewController.h
//  CrystalBall
//
//  Created by Justin Crosbie on 17/12/2013.
//  Copyright (c) 2013 Justin Crosbie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JCCrystalBall;

@interface JCViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;
@property (strong, nonatomic) JCCrystalBall *crystalBall;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImages;

-(void) makePrediction;

@end
