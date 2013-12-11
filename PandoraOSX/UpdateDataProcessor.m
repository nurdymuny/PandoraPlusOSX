//
//  UpdateDataProcessor.m
//  EasyAudioSuiteOSX
//
//  Created by BRD   on 21/05/13.
//  Copyright (c) 2013 Apptree Studio LLC. All rights reserved.
//

#import "UpdateDataProcessor.h"
#import "GenreInfo.h"
#import "StationInfo.h"
static UpdateDataProcessor *_sharedProcessor = nil;
@implementation UpdateDataProcessor
@synthesize dataContext = _dataContext;
@synthesize currentStationInfo = _currentStationInfo;


+ (id)sharedProcessor
{
    @synchronized(self)
    {
        if (_sharedProcessor == nil)
            _sharedProcessor = [[self alloc] initWithContext:[self newManagedObjectContext]];
     
        
    
    }
    return _sharedProcessor;
}



- (void)deleteAllObjects:(NSString *)entityDescription
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityDescription inManagedObjectContext:[kAppDelegate managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    NSError * error;
    NSArray * items = [[kAppDelegate managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *managedObject in items)
    {
        [[kAppDelegate managedObjectContext] deleteObject:managedObject];
    }
    
    if (![[kAppDelegate managedObjectContext] save:&error])
    {
        NSLog(@"Error deleting %@ - error:%@",entityDescription,error);
    }
    
    self.currentStationInfo = nil;
}


-(id) initWithContext:(NSManagedObjectContext *) context{
    
    self=[super init];
    if (self) {
      //  self.launchLogin = [[LaunchAtLoginController alloc]init];
        
        self.dataContext=context;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(saveContextUpdated:)
                                                     name:NSManagedObjectContextDidSaveNotification
                                                   object:self.dataContext];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(fetchContextUpdated:)
                                                     name:NSManagedObjectContextDidSaveNotification
                                                   object:[kAppDelegate managedObjectContext]];
        
        
    }
    return self;
    
}


/** Method for generating temporary Managed Object Context. **/

+ (NSManagedObjectContext *) newManagedObjectContext
{
    NSPersistentStoreCoordinator *coordinator=[kAppDelegate persistentStoreCoordinator];
    
    if (coordinator)
    {
        NSManagedObjectContext *newManagedObjectContext=[[NSManagedObjectContext alloc]init];
        [newManagedObjectContext setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
        [newManagedObjectContext setPersistentStoreCoordinator:coordinator];
        
        return newManagedObjectContext;
    }
    return nil;
}

- (void)saveStation:(NSDictionary *)stationDict

{
 // [self deleteAllObjects:@"GenreInfo"];
    
    GenreInfo *genreInfo = [NSEntityDescription insertNewObjectForEntityForName:@"GenreInfo" inManagedObjectContext:self.dataContext];
   
    genreInfo.station_Id = [stationDict valueForKey:@"station_Id"];
    genreInfo.station_name = [stationDict valueForKey:@"station_name"];
    
     
  
    NSError *error = nil;
   if ( ![genreInfo.managedObjectContext save:&error] )
    {
       NSLog(@"SAVE ERROR");
    }
    
    NSLog(@"SAVED THE FOLLOWING USER DETAILS:\nuserDict\n%@", stationDict);
    NSLog(@"%@",genreInfo);
    
    //    [self checkAndSave:userInfo];
}

- (void)saveStationDetails:(NSDictionary *)stationDict

{
    // [self deleteAllObjects:@"GenreInfo"];
    
    StationInfo *stationInfo = [NSEntityDescription insertNewObjectForEntityForName:@"StationInfo" inManagedObjectContext:self.dataContext];
    stationInfo.station_description = [stationDict valueForKey:@"description"];
    stationInfo.station_categories = [stationDict valueForKey:@"categories"];
    stationInfo.genreInfo_r = [stationDict valueForKey:@"selectedStation"];
    
    
    NSError *error = nil;
    if ( ![stationInfo.managedObjectContext save:&error] )
    {
        NSLog(@"SAVE ERROR");
    }
    NSLog(@"SAVED THE FOLLOWING USER DETAILS:\nuserDict\n%@", stationDict);
    NSLog(@"%@",stationInfo);
    
    //    [self checkAndSave:userInfo];
}



- (StationInfo *)currentStationInfo
{
    if(_currentStationInfo)
        return _currentStationInfo;
    
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"StationInfo" inManagedObjectContext:[kAppDelegate managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    NSError * error;
    NSArray * items = [[kAppDelegate managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    return [items lastObject];
}




-(void)fetchContextUpdated:(NSNotification*)notification {
    
    [self.dataContext mergeChangesFromContextDidSaveNotification:notification];
    
}

-(void)saveContextUpdated:(NSNotification*)notification {
    
    [[kAppDelegate managedObjectContext] mergeChangesFromContextDidSaveNotification:notification];
}




@end
