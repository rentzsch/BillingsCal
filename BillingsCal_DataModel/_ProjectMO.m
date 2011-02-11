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






@dynamic projectPK;



- (int)projectPKValue {
	NSNumber *result = [self projectPK];
	return [result intValue];
}

- (void)setProjectPKValue:(int)value_ {
	[self setProjectPK:[NSNumber numberWithInt:value_]];
}

- (int)primitiveProjectPKValue {
	NSNumber *result = [self primitiveProjectPK];
	return [result intValue];
}

- (void)setPrimitiveProjectPKValue:(int)value_ {
	[self setPrimitiveProjectPK:[NSNumber numberWithInt:value_]];
}





@dynamic newRelationship;

	

@dynamic slips;

	
- (NSMutableSet*)slipsSet {
	[self willAccessValueForKey:@"slips"];
	NSMutableSet *result = [self mutableSetValueForKey:@"slips"];
	[self didAccessValueForKey:@"slips"];
	return result;
}
	





@end
