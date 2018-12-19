//
//  AppStoreUpdateAppObject.h
//  AppStoreUpdateKit
//
//  Created by Jovi on 12/19/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppStoreUpdateAppObject : NSObject

@property(strong,nonatomic,readwrite)   NSString    *appName;
@property(strong,nonatomic,readwrite)   NSImage     *appIcon;
@property(strong,nonatomic,readwrite)   NSString    *productID;
@property(strong,nonatomic,readwrite)   NSString    *currentVersion;

@property(strong,nonatomic,readwrite)   NSString    *latestVersion;
@property(strong,nonatomic,readwrite)   NSString    *releaseNotes;

-(instancetype)initWithAppName:(NSString *)appName withAppIcon:(NSImage *)icon withCurrentVersion:(NSString *)currentVersion withProductID:(NSString *)productID;
-(BOOL)isNewVersionAvailable;

@end
