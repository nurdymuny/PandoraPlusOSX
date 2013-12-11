//
//  PlayerWindowController.m
//  PandoraOSX
//
//  Created by BRD on 29/10/13.
//  Copyright (c) 2013 Brian Russel Davis. All rights reserved.
//

#import "PlayerWindowController.h"

@interface PlayerWindowController ()

@end

@implementation PlayerWindowController
@synthesize audioPlayer;
@synthesize audioName_lable;
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
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}



- (IBAction)playButtonPressed:(NSButton *)sender {
    
  
        
    
    NSString *databasePath = [[NSBundle mainBundle] pathForResource:@"abc" ofType:@".mp3"];
    
        
        NSURL* file = [NSURL fileURLWithPath:databasePath];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:file error:nil];
        [audioPlayer setDelegate:self];
        audioPlayer.volume = 1.0;
    audioName_lable.stringValue = [file lastPathComponent];
        
        int currentSecond =audioPlayer.duration;
      //  int currentMinute = currentSecond / 60;
        
    
    
    [self.playerProgressSlider setMinValue:0];
    [self.playerProgressSlider setContinuous:YES];
     self.playerProgressSlider.maxValue = currentSecond;
        [audioPlayer play];
        aTime = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateSlider) userInfo:nil repeats:YES];
    

    
    
}

- (IBAction)stopButtonPressed:(id)sender {
    [audioPlayer stop];
    audioPlayer = nil;    
    [aTime invalidate];
}



- (IBAction)sliderTouchUpInside:(id)sender {
    
        [audioPlayer stop];
        audioPlayer.currentTime = self.playerProgressSlider.doubleValue;
        [audioPlayer prepareToPlay];
        [audioPlayer play];
    
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    
    [aTime invalidate];
    aTime = nil;
  
    [audioPlayer setCurrentTime:0];
    
}

-(void)animateSlider {
                NSTimeInterval currentTime = audioPlayer.currentTime;
    self.playerProgressSlider.doubleValue= currentTime;
}




@end
