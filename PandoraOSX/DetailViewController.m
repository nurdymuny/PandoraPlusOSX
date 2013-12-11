//
//  DetailViewController.m
//  PandoraOSX
//
//  Created by BRD on 28/10/13.
//  Copyright (c) 2013 Brian Russel Davis. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize detailInfo_table;
@synthesize listdata;
@synthesize stationInfo;
@synthesize playerWC;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}
-(void)awakeFromNib {
    self.managedObjectContext = [kAppDelegate managedObjectContext]; 
     [self.detailArrayController setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"station_categories" ascending:YES]]];
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    
    return [self.detailArrayController.arrangedObjects count];
}


- (NSView *)tableView:(NSTableView *)tableView
   viewForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row {
    
 
    
    DetailQueueCell *detailCell = [tableView makeViewWithIdentifier:@"DetailQueueCell" owner:self];
     stationInfo = [self.detailArrayController.arrangedObjects objectAtIndex:row];
    detailCell.descriptionLabel.stringValue = stationInfo.station_description;
    detailCell.thumbImageView.image = [NSImage imageNamed:@"abc"];
    detailCell.textField.stringValue = stationInfo.station_categories;
   
    return detailCell;
    
}


- (BOOL)tableView:(NSTableView *)aTableView shouldSelectRow:(NSInteger)rowIndex
{
   
        playerWC = [[PlayerWindowController alloc]initWithWindowNibName:@"PlayerWindowController"];
        [playerWC showWindow:self];
  
    return YES;
}

-(void)reloadDetailTable:(NSNotification *)notification
{
    
    NSTextField *textField = [notification object]; 
if(textField.stringValue.length > 0)
{
    [self.detailArrayController setFetchPredicate:[NSPredicate predicateWithFormat:@"station_categories contains[C] %@", textField.stringValue]];
}
else
{
    [self.detailArrayController setFetchPredicate:nil];
}
    [detailInfo_table reloadData];

}


@end
