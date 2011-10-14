//
//  Person.m
//  objective_resource
//
//  Created by James Burka on 1/26/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import "Person.h"
#import "Dog.h"
#import "ObjectiveResource.h"

@implementation Person 
@synthesize createdAt , updatedAt , name , personId;

-(NSString *) params{
    return [NSString stringWithFormat:@"{\"person\":{\"name\":\"%@\"}}", self.name];
}
-(NSString *) toJSON{
    return [NSString stringWithFormat:@"{\"person\":{\"name\":\"%@\"}}", self.name];
}      

- (NSString *)convertToRemoteExpectedType {	  
    //return [self performSelector:[[self class] getRemoteSerializeMethod] withObject:[self excludedPropertyNames]];
    return [NSString stringWithFormat:@"{\"person\":{\"name\":\"%@\"}}", self.name];
}


// handle pluralization 
+ (NSString *)getRemoteCollectionName {
	return @"people";
}


// this will go to the url http://localhost:3000/people/<id>/dogs
// and return the array of dogs
-(NSArray *) findAllDogs {
	return [Dog findRemote:[NSString stringWithFormat:@"%@/%@",personId,@"dogs",nil]];
}

-(NSArray *) findAllDogsWithResponse:(NSError **)aError {
	return [Dog findRemote:[NSString stringWithFormat:@"%@/%@",personId,@"dogs",nil] withResponse:aError];
}

- (void) dealloc
{
    [createdAt release];
    [updatedAt release];
    [name release];
	[personId release];
	[super dealloc];
}

@end
