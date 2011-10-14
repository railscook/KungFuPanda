//
//  CalculatorBrainAppDelegate.h
//  CalculatorBrain
//
//  Created by Swe Win on 03/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalculatorBrainViewController;

@interface CalculatorBrainAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CalculatorBrainViewController *viewController;

@end
