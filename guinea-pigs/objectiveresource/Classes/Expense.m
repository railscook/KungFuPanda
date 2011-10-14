//
//  Expense.m
//  objective_resource
//
//  Created by Swe Win on 14/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Expense.h"
#import "ObjectiveResource.h"
#import "Connection.h"
#import "Response.h"
#import "NSData+Additions.h"
#import "NSMutableURLRequest+ResponseType.h"
#import "ConnectionDelegate.h"


@interface Expense ()

-(NSString *) nestedPath;

@end


@implementation Expense

@synthesize name, expenseId, amount, createdAt , updatedAt;


static NSString *siteURL = @"http://localhost:3000";

-(NSString *) params{
    return [NSString stringWithFormat:@"{\"expense\":{\"amount\":\"%@\", \"name\":\"%@\"}}", self.name, self.amount];
}

-(void)createRemote{
    NSString *url;
    url = [NSString stringWithFormat:@"%@/expenses.json", siteURL];
   // [Resource post:[self params] to:url];
}

-(void)updateRemote{
    NSString *url;
    url = [NSString stringWithFormat:@"%@/expenses/%@.json", siteURL, self.expenseId];
//    [Resource put:[self params] to:url];
    
}

-(void)showRemote{
    NSString *url;
    url = [NSString stringWithFormat:@"%@/expenses/%@.json", siteURL, self.expenseId];
//    [Resource show:url];
    
}

-(void)destroyRemote{
    NSString *url;
    url = [NSString stringWithFormat:@"%@/expenses/%@.json", siteURL, self.expenseId];
//    [Resource delete:url];
    
}

+(NSArray *) findAllRemote{
    NSString *url;
    url = [NSString stringWithFormat:@"%@/expenses.json", siteURL];
//    NSString *jsonString =  [Resource get:url];
    NSArray *expenses; // create expense from JSON string
    return expenses;
        
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
