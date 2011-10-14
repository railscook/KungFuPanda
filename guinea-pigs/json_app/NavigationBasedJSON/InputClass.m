//
//  InputClass.m
//  NavigationBasedJSON
//
//  Created by Swe Win on 05/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InputClass.h"
#import "SBJson.h"
#import "RootViewController.h"

@implementation InputClass
@synthesize foo;
@synthesize bar;
@synthesize delegate = _delegate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Fill Form";
    }
    return self;
}

-(IBAction)form_submit{
    if (_delegate != nil && [_delegate respondsToSelector:@selector(inputClassWantsToSave:foo:bar:)]) {
        [_delegate inputClassWantsToSave:self foo:foo.text bar:bar.text];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)gggggg{
    
}

-(IBAction)cancel{
    foo.text = @"";
    bar.text = @"";
    RootViewController *viewController = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController.tableView reloadData];
    
    [viewController release];    
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
