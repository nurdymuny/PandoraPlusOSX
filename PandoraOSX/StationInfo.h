//
//  StationInfo.h
//  PandoraOSX
//
//  Created by BRD on 25/10/13.
//  Copyright (c) 2013 Brian Russel Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GenreInfo;

@interface StationInfo : NSManagedObject

@property (nonatomic, retain) NSString * station_description;
@property (nonatomic, retain) NSString * station_categories;
@property (nonatomic, retain) GenreInfo *genreInfo_r;

@end
