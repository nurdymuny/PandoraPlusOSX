//
//  DetailViewController.h
//  PandoraOSX
//
//  Created by BRD on 28/10/13.
//  Copyright (c) 2013 Brian Russel Davis. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StationInfo.h"
#import "PlayerWindowController.h"


@interface DetailViewController : NSViewController
{
    
}
@property (readwrite, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong) IBOutlet NSArrayController *detailArrayController;

@property (strong) IBOutlet NSTableView *detailInfo_table;
@property (nonatomic,retain) NSArray *listdata;
@property (strong,nonatomic) StationInfo *stationInfo;
@property(nonatomic,strong) PlayerWindowController *playerWC;

-(void)reloadDetailTable:(NSNotification *)notification;
@end
