//
//  HomeWindowController.m
//  PandoraOSX
//
//  Created by BRD on 25/10/13.
//  Copyright (c) 2013 Brian Russel Davis. All rights reserved.
//

#import "HomeWindowController.h"

@interface HomeWindowController ()

@end

@implementation HomeWindowController
@synthesize title_imageView,Status_imageView;
@synthesize listdata;
@synthesize genreInfo_table;
@synthesize detailTableVC,detailSuperView;
@synthesize genreInfo;
@synthesize stationTitle_lable;
@synthesize managedObjectContext;
@synthesize searchField;
- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    
  
    self.detailTableVC= [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    self.detailTableVC.view.frame =NSRectFromCGRect(CGRectMake(0,0, self.detailTableVC.view.frame.size.width, self.detailTableVC.view.frame.size.height));
    [self.detailSuperView addSubview:self.detailTableVC.view];

    
    [[UpdateDataProcessor sharedProcessor]deleteAllObjects:@"GenreInfo"];
    
 
    for (int i=0; i<7; i++)
    {
        
        switch (i)
        {
            case 0:
            {
                NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
                [dict setValue:@"101" forKey:@"station_Id"];
                [dict setValue:@"Halloween" forKey:@"station_name"];                
                [[UpdateDataProcessor sharedProcessor]saveStation:dict];
                
            }
                break;
            case 1:
            {
                NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
                [dict setValue:@"102" forKey:@"station_Id"];
                [dict setValue:@"Alternative" forKey:@"station_name"];
             
                [[UpdateDataProcessor sharedProcessor]saveStation:dict];
            }
                break;
            case 2:
            {
                NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
                [dict setValue:@"103" forKey:@"station_Id"];
               [dict setValue:@"Blues" forKey:@"station_name"];
      
                [[UpdateDataProcessor sharedProcessor]saveStation:dict];
            }
                break;
            case 3:
            {
                NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
                [dict setValue:@"104" forKey:@"station_Id"];
                [dict setValue:@"Classical" forKey:@"station_name"];
           
                [[UpdateDataProcessor sharedProcessor]saveStation:dict];
            }
                break;
            case 4:
            {
                NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
                [dict setValue:@"105" forKey:@"station_Id"];
                [dict setValue:@"Dance" forKey:@"station_name"];
                [[UpdateDataProcessor sharedProcessor]saveStation:dict];
                
            }
                break;
                        
            default:
                break;
        }
    }
   
     self.managedObjectContext = [kAppDelegate managedObjectContext];
     [self.queueArrayController setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"station_Id" ascending:NO]]];
    
   
    [genreInfo_table reloadData];
  
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
   
    return [self.queueArrayController.arrangedObjects count];
}


- (NSView *)tableView:(NSTableView *)tableView
   viewForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row {
    
  
    MainQueueCell  *mainCell = [tableView makeViewWithIdentifier:@"MainQueueCell" owner:self];
    genreInfo = [self.queueArrayController.arrangedObjects objectAtIndex:row];
    mainCell.textField.stringValue = genreInfo.station_name;
      [detailTableVC.detailInfo_table reloadData];
    return mainCell;
    
}


- (BOOL)tableView:(NSTableView *)aTableView shouldSelectRow:(NSInteger)rowIndex
{
    [[UpdateDataProcessor sharedProcessor]deleteAllObjects:@"StationInfo"];
    genreInfo = [self.queueArrayController.arrangedObjects objectAtIndex:rowIndex];
    stationTitle_lable.stringValue = genreInfo.station_name;
    for(NSInteger i = rowIndex; i<5;i++)
    {
        switch (i) {
            case 0:
            {
                
                StationInfo *stationInfo = [NSEntityDescription insertNewObjectForEntityForName:@"StationInfo" inManagedObjectContext:[kAppDelegate managedObjectContext]];
                
                stationInfo.station_categories = @"Country's";
                stationInfo.station_description = @"Drake,jay-z,Lorde,luck Bryan,Thomas Rhett,Blake, Tim";
                stationInfo.genreInfo_r = genreInfo;
                
                NSError *error = nil;
                if ( ![stationInfo.managedObjectContext save:&error] )
                {
                    NSLog(@"SAVE ERROR");
                }
                
                
                            }
                 break;
                case 1:
            {
                StationInfo *stationInfo = [NSEntityDescription insertNewObjectForEntityForName:@"StationInfo" inManagedObjectContext:[kAppDelegate managedObjectContext]];
                stationInfo.station_categories = @"Today Hit's";
                stationInfo.station_description = @"Luke Brayn,Thomas Rhett";
                stationInfo.genreInfo_r = genreInfo;
                
                NSError *error = nil;
                if ( ![stationInfo.managedObjectContext save:&error] )
                {
                    NSLog(@"SAVE ERROR");
                }
            }
                 break;
                case 2:
            {
                StationInfo *stationInfo = [NSEntityDescription insertNewObjectForEntityForName:@"StationInfo" inManagedObjectContext:[kAppDelegate managedObjectContext]];
                
                stationInfo.station_categories = @"Today Hip Hop's & Mix Songs";
                stationInfo.station_description = @"Drake,jay-z,Lorde";
                stationInfo.genreInfo_r = genreInfo;
                
                NSError *error = nil;
                if ( ![stationInfo.managedObjectContext save:&error] )
                {
                    NSLog(@"SAVE ERROR");
                }
            }
         
                break;
            case 3:
            {
                StationInfo *stationInfo = [NSEntityDescription insertNewObjectForEntityForName:@"StationInfo" inManagedObjectContext:[kAppDelegate managedObjectContext]];
                
                stationInfo.station_categories = @"Today Country's";
                stationInfo.station_description = @"Drake,jay-z,Lorde,luck Bryan,Thomas Rhett,Blake, Tim";
                stationInfo.genreInfo_r = genreInfo;
                
                NSError *error = nil;
                if ( ![stationInfo.managedObjectContext save:&error] )
                {
                    NSLog(@"SAVE ERROR");
                }
            }
            break;
            case 4:
            {
                StationInfo *stationInfo = [NSEntityDescription insertNewObjectForEntityForName:@"StationInfo" inManagedObjectContext:[kAppDelegate managedObjectContext]];
                
                stationInfo.station_categories = genreInfo.station_name;
                stationInfo.station_description = @"katy Perry,loard,Miley Cyrus";
                stationInfo.genreInfo_r = genreInfo;
                
                NSError *error = nil;
                if ( ![stationInfo.managedObjectContext save:&error] )
                {
                    NSLog(@"SAVE ERROR");
                }

            }
                break;
                
            default:
                break;
        }
     
   
   }

   [detailTableVC.detailInfo_table reloadData];
   return  YES;
}


- (void)controlTextDidChange:(NSNotification *)notification {
    [detailTableVC reloadDetailTable:notification];
   
}
-(void)controlTextDidEndEditing:(NSNotification *)obj
{
    [detailTableVC reloadDetailTable:nil];
}







@end
