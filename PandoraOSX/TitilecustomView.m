//
//  TitilecustomView.m
//  PandoraOSX
//
//  Created by BRD on 25/10/13.
//  Copyright (c) 2013 Brian Russel Davis. All rights reserved.
//

#import "TitilecustomView.h"

@implementation TitilecustomView

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
    
    [[NSColor whiteColor] setFill];
    NSRectFill(dirtyRect);
	[super drawRect:dirtyRect];
	
    // Drawing code here.
}

@end
