//
//  AppStoreUpdateWindowController.h
//  AppStoreUpdateKit
//
//  Created by Jovi on 12/19/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class AppStoreUpdateUIConfigure;
@class AppStoreUpdateAppObject;
@class AppStoreUpdateWindowController;

@protocol AppStoreUpdateWindowControllerDelegate <NSObject>

@optional
-(void)skipButtonClick:(AppStoreUpdateWindowController *)sender;
-(void)updateButtonClick:(AppStoreUpdateWindowController *)sender;
-(void)laterButtonClick:(AppStoreUpdateWindowController *)sender;

@end

@interface AppStoreUpdateWindowController : NSWindowController

@property(nonatomic, weak, readwrite)   id<AppStoreUpdateWindowControllerDelegate>      delegate;
@property(nonatomic, strong, readonly)  AppStoreUpdateAppObject                         *appObj;

-(instancetype)initWithAppObject:(AppStoreUpdateAppObject *)appObj withCustomizeConfigure:(AppStoreUpdateUIConfigure *)configure;

@end
