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



@property (nonatomic, retain) NSNumber *projectID;

@property int projectIDValue;
- (int)projectIDValue;
- (void)setProjectIDValue:(int)value_;

//- (BOOL)validateProjectID:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) ClientMO* client;
//- (BOOL)validateClient:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSSet* slips;
- (NSMutableSet*)slipsSet;




+ (id)fetchOneWithProjectID:(NSManagedObjectContext*)moc_ projectID:(NSNumber*)projectID_ ;
+ (id)fetchOneWithProjectID:(NSManagedObjectContext*)moc_ projectID:(NSNumber*)projectID_ error:(NSError**)error_;



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


- (NSNumber*)primitiveProjectID;
- (void)setPrimitiveProjectID:(NSNumber*)value;

- (int)primitiveProjectIDValue;
- (void)setPrimitiveProjectIDValue:(int)value_;




- (ClientMO*)primitiveClient;
- (void)setPrimitiveClient:(ClientMO*)value;



- (NSMutableSet*)primitiveSlips;
- (void)setPrimitiveSlips:(NSMutableSet*)value;


@end
