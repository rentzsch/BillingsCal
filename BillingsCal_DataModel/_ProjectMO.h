// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ProjectMO.h instead.

#import <CoreData/CoreData.h>


@class ClientMO;
@class SlipMO;




@interface ProjectMOID : NSManagedObjectID {}
@end

@interface _ProjectMO : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ProjectMOID*)objectID;



@property (nonatomic, retain) NSString *name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSNumber *projectPK;

@property int projectPKValue;
- (int)projectPKValue;
- (void)setProjectPKValue:(int)value_;

//- (BOOL)validateProjectPK:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) ClientMO* newRelationship;
//- (BOOL)validateNewRelationship:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSSet* slips;
- (NSMutableSet*)slipsSet;




@end

@interface _ProjectMO (CoreDataGeneratedAccessors)

- (void)addSlips:(NSSet*)value_;
- (void)removeSlips:(NSSet*)value_;
- (void)addSlipsObject:(SlipMO*)value_;
- (void)removeSlipsObject:(SlipMO*)value_;

@end

@interface _ProjectMO (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;


- (NSNumber*)primitiveProjectPK;
- (void)setPrimitiveProjectPK:(NSNumber*)value;

- (int)primitiveProjectPKValue;
- (void)setPrimitiveProjectPKValue:(int)value_;




- (ClientMO*)primitiveNewRelationship;
- (void)setPrimitiveNewRelationship:(ClientMO*)value;



- (NSMutableSet*)primitiveSlips;
- (void)setPrimitiveSlips:(NSMutableSet*)value;


@end
