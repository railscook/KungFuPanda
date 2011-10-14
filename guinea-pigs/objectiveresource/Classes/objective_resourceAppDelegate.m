//
//  active_resourceAppDelegate.m
//  active_resource
//
//  Created by vickeryj on 8/21/08.
//  Copyright Joshua Vickery 2008. All rights reserved.
//

#import "objective_resourceAppDelegate.h"
#import "ObjectiveResource.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@implementation objective_resourceAppDelegate

@synthesize window, navigationController;
- (void)loadServerData
{
    // Step 1
    NSString *website =@"http://0.0.0.0:3000";
    NSLog(@"From viewDidLoad request foo bar list \n %@", website);
    
    NSURL *url = [NSURL URLWithString:website];
    
    
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    
    [request setCompletionBlock:^{
        // Use when fetching text data
        NSString *responseString = [request responseString];
        
        // authenticityToken
        NSString *authenticityToken = [[request responseHeaders] objectForKey:@"X-Authenticity-Token"];
        NSLog(@"authenticityToken \n %@", authenticityToken);
        
        if([responseString length] == 0){
            [responseString release];
            return;
        }
        
        NSLog(@"responseHeaders \n %@", [request responseHeaders]);
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
    }];
    [request startAsynchronous];

}


- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	[self loadServerData];
    
	//Configure ObjectiveResource
	[ObjectiveResourceConfig setSite:@"http://localhost:3000/"];
	
	// dogs is password protected
	[ObjectiveResourceConfig setUser:@"Hiro"];
    [ObjectiveResourceConfig setPassword:@"Protagonist"];
    
    
	// use json
	// TODO: [swe] change this for JSON
	[ObjectiveResourceConfig setResponseType:JSONResponse];
	
	// use xml
	//[ObjectiveResourceConfig setResponseType:XmlResponse];
	[window addSubview:navigationController.view];
	
	// Override point for customization after app launch	
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end
