//
//  RootViewController.h
//  NavigationBasedJSON
//
//  Created by Swe Win on 04/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "SBJson.h"
#import "InputClass.h"


@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate, InputClassDelegate>
{
    NSMutableArray *list;
    NSString *connection;
    SBJsonParser *_parser;
    SBJsonWriter *_writer;
    NSString *website;
    
}
- (void)insertNewObject;
@property (nonatomic, retain) NSMutableArray *list;
@end
