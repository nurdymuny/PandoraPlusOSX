//
//  PlayerWindowController.h
//  PandoraOSX
//
//  Created by BRD on 29/10/13.
//  Copyright (c) 2013 Brian Russel Davis. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayerWindowController : NSWindowController
{
    NSTimer *aTime;
}
@property(nonatomic,strong)    AVAudioPlayer* audioPlayer;
@property (weak) IBOutlet NSSlider *playerProgressSlider;
@property (strong) IBOutlet NSTextField *audioName_lable;

- (IBAction)playButtonPressed:(NSButton *)sender;

- (IBAction)stopButtonPressed:(id)sender;


@end
