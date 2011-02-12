// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ClientMO.m instead.

#import "_ClientMO.h"

@implementation ClientMOID
@end

@implementation _ClientMO

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Client" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Client";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Client" inManagedObjectContext:moc_];
}

- (ClientMOID*)objectID {
	return (ClientMOID*)[super objectID];
}




@dynamic clientID;



- (int)clientIDValue {
	NSNumber *result = [self clientID];
	return [result intValue];
}

- (void)setClientIDValue:(int)value_ {
	[self setClientID:[NSNumber numberWithInt:value_]];
}

- (int)primitiveClientIDValue {
	NSNumber *result = [self primitiveClientID];
	return [result intValue];
}

- (void)setPrimitiveClientIDValue:(int)value_ {
	[self setPrimitiveClientID:[NSNumber numberWithInt:value_]];
}





@dynamic name;






@dynamic projects;

	
- (NSMutableSet*)projectsSet {
	[self willAccessValueForKey:@"projects"];
	NSMutableSet *result = [self mutableSetValueForKey:@"projects"];
	[self didAccessValueForKey:@"projects"];
	return result;
}
	






+ (id)fetchOneWithClientID:(NSManagedObjectContext*)moc_ clientID:(NSNumber*)clientID_ {
	NSError *error = nil;
	id result = [self fetchOneWithClientID:moc_ clientID:clientID_ error:&error];
	if (error) {
#if TARGET_OS_IPHONE
		NSLog(@"error: %@", error);
#else
		[NSApp presentError:error];
#endif
	}
	return result;
}
+ (id)fetchOneWithClientID:(NSManagedObjectContext*)moc_ clientID:(NSNumber*)clientID_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;
	
	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];
	
	NSDictionary *substitutionVariables = [NSDictionary dictionaryWithObjectsAndKeys:
														
														clientID_, @"clientID",
														
														nil];
	
	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"oneWithClientID"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"oneWithClientID\".");
	
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
				NSLog(@"WARN fetch request oneWithClientID: 0 or 1 objects expected, %u found (substitutionVariables:%@, results:%@)",
					[results count],
					substitutionVariables,
					results);
		}
	}
	
	if (error_) *error_ = error;
	return result;
}


@end
