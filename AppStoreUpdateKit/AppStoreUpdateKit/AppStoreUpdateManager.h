//
//  AppStoreUpdateManager.h
//  AppStoreUpdateKit
//
//  Created by Jovi on 12/19/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    AppUpdateWindowResultUpdate,
    AppUpdateWindowResultLater,
    AppUpdateWindowResultSkip
} AppUpdateWindowResult;

NS_ASSUME_NONNULL_BEGIN

@class AppStoreUpdateAppObject;
@interface AppStoreUpdateManager : NSObject

+(instancetype)sharedManager;

/*
 These functions will request app information from app store. Return value YES: New version is available.
 */
-(BOOL)checkAppUpdate:(AppStoreUpdateAppObject *)appObj;
-(void)checkAppUpdateAsync:(AppStoreUpdateAppObject *)appObj withCompletionBlock:(void (^)(BOOL rslt, AppStoreUpdateAppObject *AppObj))block;

/*
 If new version is available, this method will show the updateWindow and return YES, No new version will return NO.
 */
-(BOOL)requestAppUpdateWindow:(AppStoreUpdateAppObject *)appObj withCompletionCallback:(void (^)(AppUpdateWindowResult rslt, AppStoreUpdateAppObject *AppObj))block;

/*
 Record the skipped version.
 */
-(void)skipCurrentNewVersion:(AppStoreUpdateAppObject *)appObj;
-(BOOL)isCurrentNewVersionSkipped:(AppStoreUpdateAppObject *)appObj;

@end

NS_ASSUME_NONNULL_END
