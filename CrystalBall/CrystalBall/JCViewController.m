//
//  JCViewController.m
//  CrystalBall
//
//  Created by Justin Crosbie on 17/12/2013.
//  Copyright (c) 2013 Justin Crosbie. All rights reserved.
//

#import "JCViewController.h"
#import "JCCrystalBall.h"
#import <AudioToolbox/AudioToolbox.h>

@interface JCViewController ()

@end

@implementation JCViewController {
    SystemSoundID soundEffect;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"crystal_ball" ofType:@"mp3"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID(CFBridgingRetain(soundURL), &soundEffect);
    
    self.crystalBall = [[JCCrystalBall alloc] init];
    self.backgroundImages.animationImages = [[NSArray alloc] initWithObjects:
                                             [UIImage imageNamed:@"ball01"],
                                             [UIImage imageNamed:@"ball02"],
                                             [UIImage imageNamed:@"ball03"],
                                             [UIImage imageNamed:@"ball04"],
                                             [UIImage imageNamed:@"ball05"],
                                             [UIImage imageNamed:@"ball06"],
                                             [UIImage imageNamed:@"ball07"],
                                             [UIImage imageNamed:@"ball08"],
                                             [UIImage imageNamed:@"ball09"],
                                             [UIImage imageNamed:@"ball10"],
                                             [UIImage imageNamed:@"ball11"],
                                             [UIImage imageNamed:@"ball12"],
                                             [UIImage imageNamed:@"ball13"],
                                             [UIImage imageNamed:@"ball14"],
                                             [UIImage imageNamed:@"ball15"],
                                             [UIImage imageNamed:@"ball16"],
                                             [UIImage imageNamed:@"ball17"],
                                             [UIImage imageNamed:@"ball18"],
                                             [UIImage imageNamed:@"ball19"],
                                             [UIImage imageNamed:@"ball20"],
                                             [UIImage imageNamed:@"ball21"],
                                             [UIImage imageNamed:@"ball22"],
                                             [UIImage imageNamed:@"ball23"],
                                             [UIImage imageNamed:@"ball24"],
                                                                nil
                                            ];
    
    self.backgroundImages.animationDuration = 1.0f;
    self.backgroundImages.animationRepeatCount = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Prediction Methods

-(void) makePrediction {
    [self.backgroundImages startAnimating];
    self.predictionLabel.text = [self.crystalBall randomPrediction];

    AudioServicesPlaySystemSound(soundEffect);
    
    [UIView animateWithDuration:3.0 animations:^{
            self.predictionLabel.alpha = 1.0f;
        }
     ];
}

#pragma mark - Motion Methods

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    NSLog(@"Motion Began");
    
    self.predictionLabel.text = Nil;
    self.predictionLabel.alpha = 0.0f;
}

-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    NSLog(@"Motion Ended");

    if ( motion == UIEventSubtypeMotionShake ) {
        [self makePrediction];
    }
}

-(void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    NSLog(@"Motion Cancelled");
    
}

#pragma mark - Touch Methods

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    self.predictionLabel.text = Nil;
    self.predictionLabel.alpha = 0.0f;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self makePrediction];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}


@end
