//
//  RootViewController.m
//  NavigationBasedJSON
//
//  Created by Swe Win on 04/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "InputClass.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@implementation RootViewController
@synthesize list = _list;

- (void)loadServerData
{
    // Step 1
    website = @"http://0.0.0.0:3000/foo_bars.json";
    NSString *s =website;
    NSLog(@"From viewDidLoad request foo bar list \n %@", s);
    
    NSURL *url = [NSURL URLWithString:s];
    
    
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    
    [request setCompletionBlock:^{
        // Use when fetching text data
        NSString *responseString = [request responseString];
        
        
        if([responseString length] == 0){
            [responseString release];
            return;
        }
        
        NSArray *arr = [_parser objectWithString:responseString error:nil];
        
        list = [[NSMutableArray arrayWithArray:arr] retain];
        
        [self.tableView reloadData];
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
    }];
    [request startAsynchronous];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"List";
    
    _parser = [[SBJsonParser alloc] init];
    // Set up the edit and add buttons.
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] 
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
                                  target:self 
                                  action:@selector(insertNewObject)];
    
    
    self.navigationItem.rightBarButtonItem = addButton;
    [addButton release];
    
    
    [self loadServerData];
    

}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self loadServerData];
    
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [list count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell.
    NSMutableString *text = [NSMutableString stringWithString:@"\n"];
    NSDictionary *dictionary = [list objectAtIndex:indexPath.row];
    [text appendFormat:@"%@ ", [dictionary objectForKey:@"foo"]];
	[text appendFormat:@": %@", [dictionary objectForKey:@"bar"]];
    cell.textLabel.text = text;  
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"CLick Delete button");
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSLog(@"%@", indexPath);
        NSDictionary *dictionary = [list objectAtIndex:indexPath.row];
        NSArray* index = [dictionary objectForKey:@"id"];
        NSLog(@"INDEX %@", index);
        NSURL *url;
        NSMutableString *urlString;
        urlString=[[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"http://0.0.0.0:3000/foo_bars/%@", index]];
        url = [NSURL URLWithString:urlString];
        __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        [request setRequestMethod:@"DELETE"];
        [request setCompletionBlock:^{
            [self loadServerData];
        }];
        [request setFailedBlock:^{
            NSError *error = [request error];
        }];
        [request startAsynchronous];
        
        [list removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}

-(void) inputClassWantsToSave:(InputClass *)inputClass foo:(NSString *)foo bar:(NSString *)bar
{
    NSLog(@"inputClassWantsToSave: %@, %@",foo,bar);
     // Step 1
     website = @"http://0.0.0.0:3000/foo_bars.json";
     NSString *s =website;
     NSURL *url = [NSURL URLWithString:s];
     __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
     
    [request setPostValue:foo forKey:@"foo"];
    [request setPostValue:bar forKey:@"bar"];
    [request setCompletionBlock:^{
     // Use when fetching text data
     NSString *responseString = [request responseString];
     
         NSLog(@"Insert Complete: %@",responseString);
         NSDictionary *dict = [_parser objectWithString:responseString error:nil];
         
         [list addObject:dict];
         //[self.tableView reloadData];
         
         [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:[list count]-1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
     
     }];
     [request setFailedBlock:^{
     NSError *error = [request error];
     }];
     [request startAsynchronous];
}

-(void)insertNewObject  
{
    InputClass *viewController = [[InputClass alloc] initWithNibName:@"InputClass" bundle:nil];
    viewController.delegate = self;
    [self.navigationController pushViewController:viewController animated:YES];
    
    [viewController release];    
    
}

// Override to support rearranging the table view.
/*
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSLog(@"CLick move Row");

}
*/
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    NSLog(@"CLick canMoveRow");
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
/*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"Nib name" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
*/
}


- (void)dealloc
{
    [list release];
    [_parser release];    
    [_writer release];
    [super dealloc];
}

     + (NSString *) encodeFormPostParameters: (NSDictionary *) parameters {
         NSMutableString *formPostParams = [[[NSMutableString alloc] init] autorelease];
         
         NSEnumerator *keys = [parameters keyEnumerator];
         
         NSString *name = [keys nextObject];
         while (nil != name) {
             NSString *encodedValue = [((NSString *) CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef) [parameters objectForKey: name], NULL, CFSTR("=/:"), kCFStringEncodingUTF8)) autorelease];
             
             [formPostParams appendString: name];
             [formPostParams appendString: @"="];
             [formPostParams appendString: encodedValue];
             
             name = [keys nextObject];
             
             if (nil != name) {
                 [formPostParams appendString: @"&"];
             }
         }
         
         return formPostParams;
     }
/*     
     - (void) setFormPostParameters: (NSDictionary *) parameters {
         NSString *formPostParams = [NSMutableURLRequest encodeFormPostParameters: parameters];
         
         [self setHTTPBody: [formPostParams dataUsingEncoding: NSUTF8StringEncoding]];
         [self setValue: @"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField: @"Content-Type"];
     }
*/    

- (NSData*)generateFormData:(NSDictionary*)dict
{
	NSString* boundary = [NSString stringWithString:@"_insert_some_boundary_here_"];
	NSArray* keys = [dict allKeys];
	NSMutableData* result = [[NSMutableData alloc] initWithCapacity:100];
    
	int i;
	for (i = 0; i < [keys count]; i++) 
	{
		id value = [dict valueForKey: [keys objectAtIndex: i]];
		[result appendData:[[NSString stringWithFormat:@"--%@\n", boundary] dataUsingEncoding:NSASCIIStringEncoding]];
		if ([value class] == [NSString class] || [value class] == [NSConstantString class])
		{
			[result appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\n\n", [keys objectAtIndex:i]] dataUsingEncoding:NSASCIIStringEncoding]];
			[result appendData:[[NSString stringWithFormat:@"%@",value] dataUsingEncoding:NSASCIIStringEncoding]];
		}
		else if ([value class] == [NSURL class] && [value isFileURL])
		{
//			[result appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\n", [keys objectAtIndex:i], [[value path] lastPathComponent]] dataUsingEncoding:NSASCIIStringEncoding]];
			[result appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; \n", [keys objectAtIndex:i]] dataUsingEncoding:NSASCIIStringEncoding]];            
			[result appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\n\n"] dataUsingEncoding:NSASCIIStringEncoding]];
			[result appendData:[NSData dataWithContentsOfFile:[value path]]];
		}
		[result appendData:[[NSString stringWithString:@"\n"] dataUsingEncoding:NSASCIIStringEncoding]];
	}
	[result appendData:[[NSString stringWithFormat:@"--%@--\n", boundary] dataUsingEncoding:NSASCIIStringEncoding]];
	
	return [result autorelease];
}

+(NSData *)dataForPOSTWithDictionary:(NSDictionary *)aDictionary boundary:(NSString *)aBoundary {
    NSArray *myDictKeys = [aDictionary allKeys];
    NSMutableData *myData = [NSMutableData dataWithCapacity:1];
    NSString *myBoundary = [NSString stringWithFormat:@"--%@\r\n", aBoundary];
    
    for(int i = 0;i < [myDictKeys count];i++) {
        id myValue = [aDictionary valueForKey:[myDictKeys objectAtIndex:i]];
        [myData appendData:[myBoundary dataUsingEncoding:NSUTF8StringEncoding]];
        //if ([myValue class] == [NSString class]) {
        if ([myValue isKindOfClass:[NSString class]]) {
            [myData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", [myDictKeys objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [myData appendData:[[NSString stringWithFormat:@"%@", myValue] dataUsingEncoding:NSUTF8StringEncoding]];
        } else if(([myValue isKindOfClass:[NSURL class]]) && ([myValue isFileURL])) {
            [myData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", [myDictKeys objectAtIndex:i], [[myValue path] lastPathComponent]] dataUsingEncoding:NSUTF8StringEncoding]];
            [myData appendData:[[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            [myData appendData:[NSData dataWithContentsOfFile:[myValue path]]];
        } else if(([myValue isKindOfClass:[NSData class]])) {
            [myData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", [myDictKeys objectAtIndex:i], [myDictKeys objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [myData appendData:[[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            [myData appendData:myValue];
        } // eof if()
        
        [myData appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    } // eof for()
    [myData appendData:[[NSString stringWithFormat:@"--%@--\r\n", aBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    return myData;
} // eof dataForPOSTWithDictionary:boundary:

@end
