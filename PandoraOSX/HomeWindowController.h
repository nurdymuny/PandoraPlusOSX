//
//  HomeWindowController.h
//  PandoraOSX
//
//  Created by BRD on 25/10/13.
//  Copyright (c) 2013 Brian Russel Davis. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "MainQueueCell.h"
#import "GenreInfo.h"
#import "DetailQueueCell.h"
#import "DetailViewController.h"

@interface HomeWindowController : NSWindowController
{
    NSTableView *_genreInfo_table;
   
    GenreInfo *selectedStation;
    IBOutlet NSTableView *depart_table;
}
@property (readwrite, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong) IBOutlet NSView *title_imageView;
@property (strong) IBOutlet NSView *Status_imageView;
@property (nonatomic,retain) NSArray *listdata;
@property (strong) IBOutlet DetailViewController *detailTableVC;
@property (strong) IBOutlet NSView *detailSuperView;
@property (strong,nonatomic) GenreInfo *genreInfo;

@property (strong) IBOutlet NSTableView *genreInfo_table;
@property (strong) IBOutlet NSTextField *stationTitle_lable;
@property (strong) IBOutlet NSArrayController *queueArrayController;
@property (strong) IBOutlet NSSearchField *searchField;

@end
