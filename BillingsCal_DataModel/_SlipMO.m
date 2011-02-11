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




@dynamic slipPK;



- (int)slipPKValue {
	NSNumber *result = [self slipPK];
	return [result intValue];
}

- (void)setSlipPKValue:(int)value_ {
	[self setSlipPK:[NSNumber numberWithInt:value_]];
}

- (int)primitiveSlipPKValue {
	NSNumber *result = [self primitiveSlipPK];
	return [result intValue];
}

- (void)setPrimitiveSlipPKValue:(int)value_ {
	[self setPrimitiveSlipPK:[NSNumber numberWithInt:value_]];
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
	





@end
