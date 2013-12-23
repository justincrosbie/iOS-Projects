//
//  JCCrystalBall.m
//  CrystalBall
//
//  Created by Justin Crosbie on 18/12/2013.
//  Copyright (c) 2013 Justin Crosbie. All rights reserved.
//

#import "JCCrystalBall.h"

@implementation JCCrystalBall

- (NSArray*) predictions {
    if ( _predictions == NULL ) {
        _predictions = [[NSArray alloc] initWithObjects:
                        @"It is decidedly so",
                        @"Of course",
                        @"Mos Def, Beatch!",
                        @"Word, Mo-Fo...",
                        @"Don't shizzle my nizzle",
                        @"Bitch, you be trippin!",
                        @"Da Nigga be iced",
                        @"Mutha Fukka!",
                        nil
                        ];
    }
    
    return _predictions;
}

- (NSString*) randomPrediction {
    return [self.predictions objectAtIndex:arc4random_uniform(self.predictions.count)];
}

@end
