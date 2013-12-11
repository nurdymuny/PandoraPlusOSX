//
//  DetailQueueCell.h
//  PandoraOSX
//
//  Created by BRD on 28/10/13.
//  Copyright (c) 2013 Brian Russel Davis. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DetailQueueCell : NSTableCellView
@property (weak) IBOutlet NSImageView *thumbImageView;
@property (weak) IBOutlet NSTextField *descriptionLabel;
@end
