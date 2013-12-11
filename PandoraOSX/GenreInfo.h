//
//  GenreInfo.h
//  PandoraOSX
//
//  Created by BRD on 25/10/13.
//  Copyright (c) 2013 Brian Russel Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class StationInfo;

@interface GenreInfo : NSManagedObject

@property (nonatomic, retain) NSString * station_name;
@property (nonatomic, retain) NSString * station_Id;
@property (nonatomic, retain) NSSet *stationInfo;
@end

@interface GenreInfo (CoreDataGeneratedAccessors)

- (void)addStationInfoObject:(StationInfo *)value;
- (void)removeStationInfoObject:(StationInfo *)value;
- (void)addStationInfo:(NSSet *)values;
- (void)removeStationInfo:(NSSet *)values;



@end
