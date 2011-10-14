//
//  CalculatorBrainViewController.m
//  CalculatorBrain
//
//  Created by Swe Win on 03/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrainViewController.h"

@implementation CalculatorBrainViewController
/*
- (NSString *)stringWithUrl:(NSURL *)url
{
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
                                                cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                            timeoutInterval:30];
    // Fetch the JSON response
	NSData *urlData;
	NSURLResponse *response;
	NSError *error;
    
	// Make synchronous request
	urlData = [NSURLConnection sendSynchronousRequest:urlRequest
                                    returningResponse:&amp;response
                                                error:&amp;error];
    
 	// Construct a String around the Data from the response
	return [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
}

- (id) objectWithUrl:(NSURL *)url
{
	SBJSON *jsonParser = [SBJSON new];
	NSString *jsonString = [self stringWithUrl:url];
    
	// Parse the JSON into an Object
	return [jsonParser objectWithString:jsonString error:NULL];
}
- (NSDictionary *) downloadPublicJaikuFeed 
{
	id response = [self objectWithUrl:[NSURL URLWithString:@"http://jaiku.com/feed/json"]];
    
	NSDictionary *feed = (NSDictionary *)response;
	return feed;
}

//NSDictionary *feed = [self downloadPublicJaikuFeed];
//NSLog(@"Here is the title of the feed: %@", [feed valueForKey:@"title"]);
 */

- (CalculatorBrain *)brain{
    if (!brain) {
        brain = [[CalculatorBrain alloc] init];
    }
    return brain;
}

- (IBAction)digitalPressed:(UIButton *)sender{
    NSString *digit = [[sender titleLabel] text];
    if(userIsInTheMiddleOfTypingANumber){
        [display setText:[[display text] stringByAppendingString:digit]];
        
    }else{
        [display setText:digit];
        userIsInTheMiddleOfTypingANumber = YES;
    }
}

- (IBAction)operationPressed:(UIButton *)sender{
    if(userIsInTheMiddleOfTypingANumber){
        [[self brain] setOperand:[[display text] doubleValue]];
        userIsInTheMiddleOfTypingANumber = NO;
    }
    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain] performOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g",result]];
}


@end
