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




@dynamic clientPK;



- (int)clientPKValue {
	NSNumber *result = [self clientPK];
	return [result intValue];
}

- (void)setClientPKValue:(int)value_ {
	[self setClientPK:[NSNumber numberWithInt:value_]];
}

- (int)primitiveClientPKValue {
	NSNumber *result = [self primitiveClientPK];
	return [result intValue];
}

- (void)setPrimitiveClientPKValue:(int)value_ {
	[self setPrimitiveClientPK:[NSNumber numberWithInt:value_]];
}





@dynamic name;






@dynamic projects;

	
- (NSMutableSet*)projectsSet {
	[self willAccessValueForKey:@"projects"];
	NSMutableSet *result = [self mutableSetValueForKey:@"projects"];
	[self didAccessValueForKey:@"projects"];
	return result;
}
	





@end
