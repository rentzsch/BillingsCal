// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ProjectMO.m instead.

#import "_ProjectMO.h"

@implementation ProjectMOID
@end

@implementation _ProjectMO

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Project";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Project" inManagedObjectContext:moc_];
}

- (ProjectMOID*)objectID {
	return (ProjectMOID*)[super objectID];
}




@dynamic name;






@dynamic projectID;



- (int)projectIDValue {
	NSNumber *result = [self projectID];
	return [result intValue];
}

- (void)setProjectIDValue:(int)value_ {
	[self setProjectID:[NSNumber numberWithInt:value_]];
}

- (int)primitiveProjectIDValue {
	NSNumber *result = [self primitiveProjectID];
	return [result intValue];
}

- (void)setPrimitiveProjectIDValue:(int)value_ {
	[self setPrimitiveProjectID:[NSNumber numberWithInt:value_]];
}





@dynamic client;

	

@dynamic slips;

	
- (NSMutableSet*)slipsSet {
	[self willAccessValueForKey:@"slips"];
	NSMutableSet *result = [self mutableSetValueForKey:@"slips"];
	[self didAccessValueForKey:@"slips"];
	return result;
}
	






+ (id)fetchOneWithProjectID:(NSManagedObjectContext*)moc_ projectID:(NSNumber*)projectID_ {
	NSError *error = nil;
	id result = [self fetchOneWithProjectID:moc_ projectID:projectID_ error:&error];
	if (error) {
#if TARGET_OS_IPHONE
		NSLog(@"error: %@", error);
#else
		[NSApp presentError:error];
#endif
	}
	return result;
}
+ (id)fetchOneWithProjectID:(NSManagedObjectContext*)moc_ projectID:(NSNumber*)projectID_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;
	
	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];
	
	NSDictionary *substitutionVariables = [NSDictionary dictionaryWithObjectsAndKeys:
														
														projectID_, @"projectID",
														
														nil];
	
	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"oneWithProjectID"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"oneWithProjectID\".");
	
	id result = nil;
	NSArray *results = [moc_ executeFetchRequest:fetchRequest error:&error];
	
	if (!error) {
		switch ([results count]) {
			case 0:
				//	Nothing found matching the fetch request. That's cool, though: we'll just return nil.
				break;
			case 1:
				result = [results objectAtIndex:0];
				break;
			default:
				NSLog(@"WARN fetch request oneWithProjectID: 0 or 1 objects expected, %u found (substitutionVariables:%@, results:%@)",
					[results count],
					substitutionVariables,
					results);
		}
	}
	
	if (error_) *error_ = error;
	return result;
}


@end
