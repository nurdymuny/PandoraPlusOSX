//
//  UpdateDataProcessor.h
//  EasyAudioSuiteOSX
//
//  Created by BRD   on 21/05/13.
//  Copyright (c) 2013 Apptree Studio LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenreInfo.h"
#import "Constants.h"
#import "StationInfo.h"


@interface UpdateDataProcessor : NSObject {

    
}
- (void)deleteAllObjects:(NSString *)entityDescription;
+ (id)sharedProcessor;
@property (strong,nonatomic) NSManagedObjectContext *dataContext;
@property (strong, nonatomic) StationInfo *currentStationInfo;
- (void)saveStation:(NSDictionary *)stationDict;
- (void)saveStationDetails:(NSDictionary *)userDict;
@end
