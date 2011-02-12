// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EntryMO.m instead.

#import "_EntryMO.h"

@implementation EntryMOID
@end

@implementation _EntryMO

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Entry";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Entry" inManagedObjectContext:moc_];
}

- (EntryMOID*)objectID {
	return (EntryMOID*)[super objectID];
}




@dynamic endInSecondsSince1970;



- (double)endInSecondsSince1970Value {
	NSNumber *result = [self endInSecondsSince1970];
	return [result doubleValue];
}

- (void)setEndInSecondsSince1970Value:(double)value_ {
	[self setEndInSecondsSince1970:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveEndInSecondsSince1970Value {
	NSNumber *result = [self primitiveEndInSecondsSince1970];
	return [result doubleValue];
}

- (void)setPrimitiveEndInSecondsSince1970Value:(double)value_ {
	[self setPrimitiveEndInSecondsSince1970:[NSNumber numberWithDouble:value_]];
}





@dynamic startInSecondsSince1970;



- (double)startInSecondsSince1970Value {
	NSNumber *result = [self startInSecondsSince1970];
	return [result doubleValue];
}

- (void)setStartInSecondsSince1970Value:(double)value_ {
	[self setStartInSecondsSince1970:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveStartInSecondsSince1970Value {
	NSNumber *result = [self primitiveStartInSecondsSince1970];
	return [result doubleValue];
}

- (void)setPrimitiveStartInSecondsSince1970Value:(double)value_ {
	[self setPrimitiveStartInSecondsSince1970:[NSNumber numberWithDouble:value_]];
}





@dynamic slip;

	





@end
