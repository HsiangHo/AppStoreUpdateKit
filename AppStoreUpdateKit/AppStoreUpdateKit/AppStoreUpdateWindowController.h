//
//  AppStoreUpdateWindowController.h
//  AppStoreUpdateKit
//
//  Created by Jovi on 12/19/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AppStoreUpdateWindowControllerDelegate <NSObject>

@optional
-(void)skipButtonClick:(id)sender;
-(void)updateButtonClick:(id)sender;
-(void)laterButtonClick:(id)sender;

@end

@class AppStoreUpdateAppObject;
@interface AppStoreUpdateWindowController : NSWindowController

@property(nonatomic, strong, readonly)  NSButton                                        *btnSkip;
@property(nonatomic, strong, readonly)  NSButton                                        *btnLater;
@property(nonatomic, strong, readonly)  NSButton                                        *btnUpdate;
@property(nonatomic, weak, readonly)    id<AppStoreUpdateWindowControllerDelegate>      delegate;

-(instancetype)initWithAppObject:(AppStoreUpdateAppObject *)appObj;

@end

NS_ASSUME_NONNULL_END
