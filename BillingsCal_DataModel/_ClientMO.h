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



@property (nonatomic, retain) NSNumber *clientPK;

@property int clientPKValue;
- (int)clientPKValue;
- (void)setClientPKValue:(int)value_;

//- (BOOL)validateClientPK:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSString *name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSSet* projects;
- (NSMutableSet*)projectsSet;




@end

@interface _ClientMO (CoreDataGeneratedAccessors)

- (void)addProjects:(NSSet*)value_;
- (void)removeProjects:(NSSet*)value_;
- (void)addProjectsObject:(ProjectMO*)value_;
- (void)removeProjectsObject:(ProjectMO*)value_;

@end

@interface _ClientMO (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveClientPK;
- (void)setPrimitiveClientPK:(NSNumber*)value;

- (int)primitiveClientPKValue;
- (void)setPrimitiveClientPKValue:(int)value_;


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSMutableSet*)primitiveProjects;
- (void)setPrimitiveProjects:(NSMutableSet*)value;


@end
