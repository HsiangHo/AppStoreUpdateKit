//
//  AppStoreUpdateAppObject.m
//  AppStoreUpdateKit
//
//  Created by Jovi on 12/19/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import "AppStoreUpdateAppObject.h"

@implementation AppStoreUpdateAppObject{
    NSString            *_appName;
    NSImage             *_appIcon;
    NSString            *_productID;
    NSString            *_currentVersion;
    NSString            *_latestVersion;
    NSString            *_releaseNotes;
}

-(instancetype)initWithAppName:(NSString *)appName withAppIcon:(NSImage *)icon withCurrentVersion:(NSString *)currentVersion withProductID:(NSString *)productID{
    if(self = [super init]){
        _appName = appName;
        _appIcon = icon;
        _currentVersion = currentVersion;
        _productID = productID;
    }
    return self;
}

-(BOOL)isNewVersionAvailable{
    BOOL bRslt = NO;
    if (nil != _releaseNotes) {
        NSComparisonResult comparisonResult = [_currentVersion compare:_latestVersion options:NSNumericSearch];
        if (NSOrderedAscending == comparisonResult) {
            bRslt = YES;
        }
    }
    return bRslt;
}

@end
