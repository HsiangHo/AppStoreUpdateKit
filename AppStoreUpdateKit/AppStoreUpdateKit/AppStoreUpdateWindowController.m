//
//  AppStoreUpdateWindowController.m
//  AppStoreUpdateKit
//
//  Created by Jovi on 12/19/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import "AppStoreUpdateWindowController.h"
#import "AppStoreUpdateAppObject.h"
#import "ASUButton.h"
#import "ASUView.h"
#import "AppStoreUpdateUIConfigure.h"

@interface AppStoreUpdateWindowController ()

@end

@implementation AppStoreUpdateWindowController{
    AppStoreUpdateAppObject                                *_appObj;
    NSImageView                                            *_ivIcon;
    NSTextField                                            *_lbName;
    NSTextField                                            *_lbVersion;
    NSTextField                                            *_lbReleaseNotes;
    ASUButton                                              *_btnSkip;
    ASUButton                                              *_btnLater;
    ASUButton                                              *_btnUpdate;
    __weak id<AppStoreUpdateWindowControllerDelegate>      _delegate;
    NSString                                               *_releaseNotesNoneText;
    NSString                                               *_releaseNotesText;
}

-(instancetype)initWithAppObject:(AppStoreUpdateAppObject *)appObj withCustomizeConfigure:(AppStoreUpdateUIConfigure *)configure{
    if (self = [super init]) {
        _appObj = appObj;
        [self __initializeAppStoreUpdateWindowController: configure];
    }
    return self;
}

-(void)__initializeAppStoreUpdateWindowController:(AppStoreUpdateUIConfigure *)configure {
    NSRect rctWindow = NSMakeRect(0, 0, 320, 485);
    NSWindow *window = [[NSWindow alloc] initWithContentRect:rctWindow styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskFullSizeContentView | NSClosableWindowMask backing:NSBackingStoreBuffered defer:YES];
    [self setWindow:window];
    [window setLevel:NSFloatingWindowLevel];
    [window setTitlebarAppearsTransparent:YES];
    [window setTitleVisibility:NSWindowTitleHidden];
    [window setMovableByWindowBackground:YES];
    [window center];
    [window setBackgroundColor:[NSColor whiteColor]];
    [window setAnimationBehavior:NSWindowAnimationBehaviorAlertPanel];
    
    ASUView *contentView = [[ASUView alloc] init];
    [window setContentView:contentView];
    
    [[window standardWindowButton:NSWindowMiniaturizeButton] setHidden:YES];
    [[window standardWindowButton:NSWindowZoomButton] setHidden:YES];
    
    _ivIcon = [[NSImageView alloc] initWithFrame:NSMakeRect((NSWidth(rctWindow) - 96) / 2, NSHeight(rctWindow) - 140, 96, 96)];
    [_ivIcon setImageScaling:NSImageScaleAxesIndependently];
    [window.contentView addSubview:_ivIcon];
    [_ivIcon setImage:[_appObj appIcon]];
    
    _lbName = [[NSTextField alloc] initWithFrame:NSMakeRect(0, NSMinY(_ivIcon.frame) - 40, NSWidth(rctWindow), 36)];
    [_lbName setEditable:NO];
    [_lbName setBezeled:NO];
    [_lbName setSelectable:NO];
    [_lbName setTextColor:[NSColor colorWithCalibratedRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0]];
    [_lbName setBackgroundColor:[NSColor clearColor]];
    [_lbName setFont:[NSFont fontWithName:@"Helvetica Neue Light" size:32]];
    [_lbName setAlignment:NSCenterTextAlignment];
    [_lbName setStringValue:[_appObj appName]];
    [window.contentView addSubview:_lbName];
    
    _lbVersion = [[NSTextField alloc] initWithFrame:NSMakeRect((NSWidth(rctWindow) - 110) / 2, NSMinY(_lbName.frame) - 30, 110, 19)];
    [_lbVersion setWantsLayer:YES];
    _lbVersion.layer.backgroundColor = [NSColor colorWithCalibratedRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0].CGColor;
    _lbVersion.layer.cornerRadius = 10.0f;
    [_lbVersion setEditable:NO];
    [_lbVersion setBezeled:NO];
    [_lbVersion setSelectable:NO];
    [_lbVersion setTextColor:[NSColor colorWithCalibratedRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0]];
    [_lbVersion setBackgroundColor:[NSColor clearColor]];
    [_lbVersion setFont:[NSFont fontWithName:@"Helvetica Neue" size:15]];
    [_lbVersion setAlignment:NSCenterTextAlignment];
    [_lbVersion setStringValue:[NSString stringWithFormat:@"Version %@",[_appObj latestVersion]]];
    if (nil != [configure versionText]) {
        [_lbVersion setStringValue:[NSString stringWithFormat:[configure versionText], [_appObj latestVersion]]];
    }
    [window.contentView addSubview:_lbVersion];
    
    _releaseNotesNoneText = [configure releaseNotesNoneText];
    _releaseNotesText = [configure releaseNotesText];
    _lbReleaseNotes = [[NSTextField alloc] initWithFrame:NSMakeRect((NSWidth(rctWindow) - 250) / 2,NSMinY(_lbName.frame) - 170, 250, 95)];
    [_lbReleaseNotes setEditable:NO];
    [_lbReleaseNotes setBezeled:NO];
    [_lbReleaseNotes setSelectable:NO];
    [_lbReleaseNotes setTextColor:[NSColor colorWithCalibratedRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0]];
    [_lbReleaseNotes setBackgroundColor:[NSColor clearColor]];
    [_lbReleaseNotes setFont:[NSFont fontWithName:@"Helvetica Neue" size:13]];
    [_lbReleaseNotes setAlignment:NSLeftTextAlignment];
    [_lbReleaseNotes setStringValue:[self __formatedReleaseNotes:[_appObj releaseNotes]]];
    [window.contentView addSubview:_lbReleaseNotes];
    
    _btnUpdate =  [[ASUButton alloc] initWithFrame:NSMakeRect((NSWidth(rctWindow) - 250) / 2, NSMinY(_lbReleaseNotes.frame) - 55, 250, 45)];
    [_btnUpdate setBackgroundColor:[NSColor colorWithSRGBRed:77/255.0 green:180/255.0 blue:243/255.0 alpha:1.0]];
    [_btnUpdate setTitleColor:[NSColor whiteColor]];
    [_btnUpdate setFont:[NSFont fontWithName:@"Helvetica Neue Medium" size:22]];
    [_btnUpdate setTitle:@"Update"];
    if (nil != [configure updateButtonTitle]) {
        [_btnUpdate setTitle:[configure updateButtonTitle]];
    }
    [_btnUpdate setAlignment:NSCenterTextAlignment];
    [_btnUpdate setTarget:self];
    [_btnUpdate setAction:@selector(updateButton_click:)];
    [window.contentView addSubview:_btnUpdate];
    
    _btnSkip = [[ASUButton alloc] initWithFrame:NSMakeRect(NSMinX(_btnUpdate.frame), NSMinY(_btnUpdate.frame) - 30, 120, 20)];
    [_btnSkip setBackgroundColor:[NSColor clearColor]];
    [_btnSkip setTitleColor:[NSColor lightGrayColor]];
    [_btnSkip setFont:[NSFont fontWithName:@"HelveticaNeue" size:14]];
    [_btnSkip setTitle:@"Skip this version"];
    if (nil != [configure skipButtonTitle]) {
        [_btnSkip setTitle:[configure skipButtonTitle]];
    }
    [_btnSkip setTarget:self];
    [_btnSkip setAction:@selector(skipButton_click:)];
    [_btnSkip setAlignment:NSLeftTextAlignment];
    [window.contentView addSubview:_btnSkip];
    
    _btnLater = [[ASUButton alloc] initWithFrame:NSMakeRect(NSMaxX(_btnUpdate.frame) - 80, NSMinY(_btnUpdate.frame) - 30, 80, 20)];
    [_btnLater setBackgroundColor:[NSColor clearColor]];
    [_btnLater setTitleColor:[NSColor lightGrayColor]];
    [_btnLater setFont:[NSFont fontWithName:@"HelveticaNeue" size:14]];
    [_btnLater setTitle:@"Later"];
    if (nil != [configure laterButtonTitle]) {
        [_btnLater setTitle:[configure laterButtonTitle]];
    }
    [_btnLater setTarget:self];
    [_btnLater setAction:@selector(laterButton_click:)];
    [_btnLater setAlignment:NSRightTextAlignment];
    [window.contentView addSubview:_btnLater];
}

-(NSString *)__formatedReleaseNotes:(NSString *)releaseNote{
    if (nil == releaseNote || [releaseNote isEqualToString:@""]) {
        if (nil != _releaseNotesNoneText) {
            return _releaseNotesNoneText;
        }
        return @"Release Notes:\n\n None.";
    }
    NSArray *array = [releaseNote componentsSeparatedByString:@"\n"];
    NSString *rslt = @"Release Notes:\n\n";
    if (nil != _releaseNotesText) {
        rslt = _releaseNotesText;
    }
    for (NSString *subItem in array) {
        rslt = [rslt stringByAppendingString:[NSString stringWithFormat:@"  ⭐️ %@\n",subItem]];
    }
    return rslt;
}

-(IBAction)updateButton_click:(id)sender{
    if ([_delegate respondsToSelector:@selector(updateButtonClick:)]) {
        [_delegate updateButtonClick:self];
    }
    [self.window orderOut:nil];
    [self close];
}

-(IBAction)skipButton_click:(id)sender{
    if ([_delegate respondsToSelector:@selector(skipButtonClick:)]) {
        [_delegate skipButtonClick:self];
    }
    [self.window orderOut:nil];
    [self close];
}

-(IBAction)laterButton_click:(id)sender{
    if ([_delegate respondsToSelector:@selector(laterButtonClick:)]) {
        [_delegate laterButtonClick:self];
    }
    [self.window orderOut:nil];
    [self close];
}

@end
