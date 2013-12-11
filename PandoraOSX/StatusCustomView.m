//
//  StatusCustomView.m
//  PandoraOSX
//
//  Created by BRD on 25/10/13.
//  Copyright (c) 2013 Brian Russel Davis. All rights reserved.
//

#import "StatusCustomView.h"

@implementation StatusCustomView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    
    [[NSColor colorWithCalibratedRed:234.0f/255.0f green:237.0f/255.0f blue:244.0f/255.0f alpha:1.0] setFill];
    NSRectFill(dirtyRect);
	[super drawRect:dirtyRect];
	
    // Drawing code here.
}

@end
