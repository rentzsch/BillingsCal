// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SlipMO.h instead.

#import <CoreData/CoreData.h>


@class ProjectMO;
@class EntryMO;




@interface SlipMOID : NSManagedObjectID {}
@end

@interface _SlipMO : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SlipMOID*)objectID;



@property (nonatomic, retain) NSNumber *slipID;

@property int slipIDValue;
- (int)slipIDValue;
- (void)setSlipIDValue:(int)value_;

//- (BOOL)validateSlipID:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSString *name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) ProjectMO* project;
//- (BOOL)validateProject:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSSet* entries;
- (NSMutableSet*)entriesSet;




+ (id)fetchOneWithSlipID:(NSManagedObjectContext*)moc_ slipID:(NSNumber*)slipID_ ;
+ (id)fetchOneWithSlipID:(NSManagedObjectContext*)moc_ slipID:(NSNumber*)slipID_ error:(NSError**)error_;



@end

@interface _SlipMO (CoreDataGeneratedAccessors)

- (void)addEntries:(NSSet*)value_;
- (void)removeEntries:(NSSet*)value_;
- (void)addEntriesObject:(EntryMO*)value_;
- (void)removeEntriesObject:(EntryMO*)value_;

@end

@interface _SlipMO (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveSlipID;
- (void)setPrimitiveSlipID:(NSNumber*)value;

- (int)primitiveSlipIDValue;
- (void)setPrimitiveSlipIDValue:(int)value_;


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (ProjectMO*)primitiveProject;
- (void)setPrimitiveProject:(ProjectMO*)value;



- (NSMutableSet*)primitiveEntries;
- (void)setPrimitiveEntries:(NSMutableSet*)value;


@end
