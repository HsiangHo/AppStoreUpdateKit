//
//  ASUButton.h
//  AppStoreUpdateKit
//
//  Created by Jovi on 12/20/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ASUButton : NSButton

@property (nonatomic, strong, readwrite)        NSColor         *backgroundColor;
@property (nonatomic, strong, readwrite)        NSColor         *titleColor;

@end

NS_ASSUME_NONNULL_END
