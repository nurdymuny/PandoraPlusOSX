//
//  Constants.h
//  EasyAudioSuiteOSX
//
//  Created by BRD   on 21/05/13.
//  Copyright (c) 2013 Apptree Studio LLC. All rights reserved.
//
#import "PandoraOSXAppDelegate.h"
#import "UpdateDataProcessor.h"
//#import "NetworkEngine.h"
//#import "Utility.h"
#ifndef EasyAudioSuiteOSX_Constants_h
#define EasyAudioSuiteOSX_Constants_h
#define kAppDelegate (PandoraOSXAppDelegate *)[[NSApplication sharedApplication] delegate]
#define ENABLE_DEBUG YES
#define kSaveLocalCopyKey @"saveLocalCopy"
#define kSaveLocalCopyPath @"saveLocalCopyPath"

#define kFacebookAccount @"facebookAccountKey"
#define kTwitterAccount @"twitterAccountKey"
#define kIsFreshUser @"isFreshUser"

#define kRegularFont(x) [NSFont fontWithName:@"Open Sans" size:x]
#define kSemiBoldFont(x) [NSFont fontWithName:@"Open Sans Semibold" size:x]
#define kBoldFont(x) [NSFont fontWithName:@"Open Sans Bold" size:x]


#endif
