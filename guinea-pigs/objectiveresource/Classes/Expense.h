//
//  Expense.h
//  objective_resource
//
//  Created by Swe Win on 14/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjectiveResource.h"

@interface Expense : NSObject {
	
	NSString *name;
    NSString *amount;
    NSString *expenseId;
    NSDate   * updatedAt;
    NSDate   * createdAt;
    
}

@property (nonatomic , retain) NSDate * createdAt;
@property (nonatomic , retain) NSDate * updatedAt;
@property (nonatomic , retain) NSString *name;
@property (nonatomic , retain) NSString *amount;
@property (nonatomic , retain) NSString *expenseId;
@end