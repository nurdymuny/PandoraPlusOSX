//
//  PandoraOSXAppDelegate.h
//  PandoraOSX
//
//  Created by BRD   on 25/10/13.
//  Copyright (c) 2013 Brian Russel Davis. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HomeWindowController.h"
@interface PandoraOSXAppDelegate : NSObject <NSApplicationDelegate>
{
    HomeWindowController *homeController;
}


@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong,nonatomic)  HomeWindowController *homeController;

- (IBAction)saveAction:(id)sender;

@end
