//
//  InputClass.h
//  NavigationBasedJSON
//
//  Created by Swe Win on 05/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InputClassDelegate;


@interface InputClass : UIViewController{
    IBOutlet UITextField *foo;
    IBOutlet UITextField *bar;
    
}

@property (nonatomic, retain) UITextField *foo;
@property (nonatomic, retain) UITextField *bar;
@property (nonatomic, assign) id<InputClassDelegate> delegate;

-(IBAction)cancel;
-(IBAction)gggggg;
-(IBAction)form_submit;
@end

@protocol InputClassDelegate <NSObject>

-(void) inputClassWantsToSave:(InputClass *)inputClass foo:(NSString *)foo bar:(NSString *)bar;

@end
