//
//  CalculatorBrain.m
//  CalculatorBrain
//
//  Created by Swe Win on 03/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)setOperand:(double)anOperand{
    operand = anOperand;
}

-(void)performWaitingOperation{
    if([@"+" isEqual:waitingOperation]) {
        operand = waitingOperand + operand;
    }else if([@"-" isEqual:waitingOperation]) {
        operand = waitingOperand - operand;
    }else if([@"*" isEqual:waitingOperation]) {
        operand = waitingOperand * operand;
    }else if([@"/" isEqual:waitingOperation]) {
        if(operand){
            // > 0
            operand = waitingOperand / operand;
        }
    }

}

- (double)performOperation:(NSString *)operation{
    if ([operation isEqual:@"sqrt"]) {
        operand = sqrt(operand);
    }else{
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}

// 3 times 5 =  (wait another operand)



@end
