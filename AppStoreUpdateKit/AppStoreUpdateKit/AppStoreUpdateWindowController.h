//
//  AppStoreUpdateWindowController.h
//  AppStoreUpdateKit
//
//  Created by Jovi on 12/19/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@class AppStoreUpdateAppObject;
@interface AppStoreUpdateWindowController : NSWindowController

-(instancetype)initWithAppObject:(AppStoreUpdateAppObject *)AppObj;

@end

NS_ASSUME_NONNULL_END
