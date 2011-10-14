//
//  CalculatorBrainViewController.h
//  CalculatorBrain
//
//  Created by Swe Win on 03/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"
@interface CalculatorBrainViewController : UIViewController{
    IBOutlet UILabel *display;
    CalculatorBrain *brain;
    BOOL userIsInTheMiddleOfTypingANumber;
}

- (IBAction)digitalPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;
@end
