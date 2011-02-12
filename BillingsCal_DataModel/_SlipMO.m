// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SlipMO.m instead.

#import "_SlipMO.h"

@implementation SlipMOID
@end

@implementation _SlipMO

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Slip" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Slip";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Slip" inManagedObjectContext:moc_];
}

- (SlipMOID*)objectID {
	return (SlipMOID*)[super objectID];
}




@dynamic slipID;



- (int)slipIDValue {
	NSNumber *result = [self slipID];
	return [result intValue];
}

- (void)setSlipIDValue:(int)value_ {
	[self setSlipID:[NSNumber numberWithInt:value_]];
}

- (int)primitiveSlipIDValue {
	NSNumber *result = [self primitiveSlipID];
	return [result intValue];
}

- (void)setPrimitiveSlipIDValue:(int)value_ {
	[self setPrimitiveSlipID:[NSNumber numberWithInt:value_]];
}





@dynamic name;






@dynamic project;

	

@dynamic entries;

	
- (NSMutableSet*)entriesSet {
	[self willAccessValueForKey:@"entries"];
	NSMutableSet *result = [self mutableSetValueForKey:@"entries"];
	[self didAccessValueForKey:@"entries"];
	return result;
}
	






+ (id)fetchOneWithSlipID:(NSManagedObjectContext*)moc_ slipID:(NSNumber*)slipID_ {
	NSError *error = nil;
	id result = [self fetchOneWithSlipID:moc_ slipID:slipID_ error:&error];
	if (error) {
#if TARGET_OS_IPHONE
		NSLog(@"error: %@", error);
#else
		[NSApp presentError:error];
#endif
	}
	return result;
}
+ (id)fetchOneWithSlipID:(NSManagedObjectContext*)moc_ slipID:(NSNumber*)slipID_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;
	
	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];
	
	NSDictionary *substitutionVariables = [NSDictionary dictionaryWithObjectsAndKeys:
														
														slipID_, @"slipID",
														
														nil];
	
	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"oneWithSlipID"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"oneWithSlipID\".");
	
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
				NSLog(@"WARN fetch request oneWithSlipID: 0 or 1 objects expected, %u found (substitutionVariables:%@, results:%@)",
					[results count],
					substitutionVariables,
					results);
		}
	}
	
	if (error_) *error_ = error;
	return result;
}


@end
