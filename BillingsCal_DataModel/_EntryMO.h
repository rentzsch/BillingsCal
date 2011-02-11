// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EntryMO.h instead.

#import <CoreData/CoreData.h>


@class SlipMO;





@interface EntryMOID : NSManagedObjectID {}
@end

@interface _EntryMO : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EntryMOID*)objectID;



@property (nonatomic, retain) NSNumber *slipFK;

@property int slipFKValue;
- (int)slipFKValue;
- (void)setSlipFKValue:(int)value_;

//- (BOOL)validateSlipFK:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSNumber *startInSecondsSince1970;

@property double startInSecondsSince1970Value;
- (double)startInSecondsSince1970Value;
- (void)setStartInSecondsSince1970Value:(double)value_;

//- (BOOL)validateStartInSecondsSince1970:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSNumber *endInSecondsSince1970;

@property double endInSecondsSince1970Value;
- (double)endInSecondsSince1970Value;
- (void)setEndInSecondsSince1970Value:(double)value_;

//- (BOOL)validateEndInSecondsSince1970:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) SlipMO* slip;
//- (BOOL)validateSlip:(id*)value_ error:(NSError**)error_;




@end

@interface _EntryMO (CoreDataGeneratedAccessors)

@end

@interface _EntryMO (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveSlipFK;
- (void)setPrimitiveSlipFK:(NSNumber*)value;

- (int)primitiveSlipFKValue;
- (void)setPrimitiveSlipFKValue:(int)value_;


- (NSNumber*)primitiveStartInSecondsSince1970;
- (void)setPrimitiveStartInSecondsSince1970:(NSNumber*)value;

- (double)primitiveStartInSecondsSince1970Value;
- (void)setPrimitiveStartInSecondsSince1970Value:(double)value_;


- (NSNumber*)primitiveEndInSecondsSince1970;
- (void)setPrimitiveEndInSecondsSince1970:(NSNumber*)value;

- (double)primitiveEndInSecondsSince1970Value;
- (void)setPrimitiveEndInSecondsSince1970Value:(double)value_;




- (SlipMO*)primitiveSlip;
- (void)setPrimitiveSlip:(SlipMO*)value;


@end
