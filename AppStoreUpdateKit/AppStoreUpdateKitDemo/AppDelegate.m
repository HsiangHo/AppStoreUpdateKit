//
//  AppDelegate.m
//  AppStoreUpdateKitDemo
//
//  Created by Jovi on 12/19/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import "AppDelegate.h"
#import <AppStoreUpdateKit/AppStoreUpdateKit.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    AppStoreUpdateAppObject *appObj = [[AppStoreUpdateAppObject alloc] initWithAppName:@"Kaka"
                                                                           withAppIcon:[NSImage imageNamed:@"cat"]
                                                                    withCurrentVersion:@"1.0.9"
                                                                         withProductID:@"1434172933"];
    AppStoreUpdateUIConfigure *UIConfigure = [[AppStoreUpdateUIConfigure alloc] init];
    [UIConfigure setSkipButtonTitle:@"Skip this version"];
    [UIConfigure setUpdateButtonTitle:@"Update"];
    [UIConfigure setLaterButtonTitle:@"Later"];
    [UIConfigure setVersionText:@"Version %@"];
    [UIConfigure setReleaseNotesText:@"Release Notes:\n\n"];
    [UIConfigure setReleaseNotesNoneText:@"Release Notes:\n\n None."];
    [[AppStoreUpdateManager sharedManager] customize:UIConfigure];
    
    BOOL bRslt = [[AppStoreUpdateManager sharedManager] checkAppUpdate:appObj];
    bRslt = [appObj isNewVersionAvailable];
    
    [[AppStoreUpdateManager sharedManager] checkAppUpdateAsync:appObj withCompletionBlock:^(BOOL rslt, AppStoreUpdateAppObject * _Nonnull AppObj) {
        if (rslt && [appObj isNewVersionAvailable] && ![[AppStoreUpdateManager sharedManager] isCurrentNewVersionSkipped:appObj]) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[AppStoreUpdateManager sharedManager] requestAppUpdateWindow:appObj withCompletionCallback:^(AppUpdateWindowResult rslt, AppStoreUpdateAppObject * _Nonnull AppObj) {
                    switch (rslt) {
                        case AppUpdateWindowResultUpdate:
                            [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"macappstore://itunes.apple.com/app/id%@",[AppObj productID]]]];
                            break;
                            
                        case AppUpdateWindowResultSkip:
                            [[AppStoreUpdateManager sharedManager] skipCurrentNewVersion:AppObj];
                            break;
                            
                        case AppUpdateWindowResultLater:
                            break;
                            
                        default:
                            break;
                    }
                }];
            });
        }
    }];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
