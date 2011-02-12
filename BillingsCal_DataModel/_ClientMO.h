// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ClientMO.h instead.

#import <CoreData/CoreData.h>


@class ProjectMO;




@interface ClientMOID : NSManagedObjectID {}
@end

@interface _ClientMO : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ClientMOID*)objectID;



@property (nonatomic, retain) NSNumber *clientID;

@property int clientIDValue;
- (int)clientIDValue;
- (void)setClientIDValue:(int)value_;

//- (BOOL)validateClientID:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSString *name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSSet* projects;
- (NSMutableSet*)projectsSet;




+ (id)fetchOneWithClientID:(NSManagedObjectContext*)moc_ clientID:(NSNumber*)clientID_ ;
+ (id)fetchOneWithClientID:(NSManagedObjectContext*)moc_ clientID:(NSNumber*)clientID_ error:(NSError**)error_;



@end

@interface _ClientMO (CoreDataGeneratedAccessors)

- (void)addProjects:(NSSet*)value_;
- (void)removeProjects:(NSSet*)value_;
- (void)addProjectsObject:(ProjectMO*)value_;
- (void)removeProjectsObject:(ProjectMO*)value_;

@end

@interface _ClientMO (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveClientID;
- (void)setPrimitiveClientID:(NSNumber*)value;

- (int)primitiveClientIDValue;
- (void)setPrimitiveClientIDValue:(int)value_;


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSMutableSet*)primitiveProjects;
- (void)setPrimitiveProjects:(NSMutableSet*)value;


@end
