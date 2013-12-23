//
//  JCCrystalBall.h
//  CrystalBall
//
//  Created by Justin Crosbie on 18/12/2013.
//  Copyright (c) 2013 Justin Crosbie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCCrystalBall : NSObject {
    NSArray *_predictions;
}

@property (strong, nonatomic, readonly) NSArray *predictions;

- (NSString*) randomPrediction;

@end
