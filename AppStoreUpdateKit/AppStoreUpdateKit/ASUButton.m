//
//  ASUButton.m
//  AppStoreUpdateKit
//
//  Created by Jovi on 12/20/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import "ASUButton.h"

@implementation ASUButton{
    NSColor         *_backgroundColor;
    NSColor         *_titleColor;
}

-(instancetype)initWithFrame:(NSRect)frameRect{
    if (self = [super initWithFrame:frameRect]) {
        [self __initializeASUButton];
    }
    return self;
}

- (void)mouseEntered:(NSEvent *)theEvent{
    [[NSCursor pointingHandCursor] set];
}

- (void)mouseExited:(NSEvent *)theEvent{
    [[NSCursor arrowCursor] set];
}

-(void)setBackgroundColor:(NSColor *)backgroundColor{
    _backgroundColor = backgroundColor;
    self.layer.backgroundColor = _backgroundColor.CGColor;
}

-(void)setTitleColor:(NSColor *)titleColor{
    _titleColor = titleColor;
    [self setAttributedTitle:[self __titleAttributedString]];
}

-(void)setTitle:(NSString *)title{
    [super setTitle:title];
    [self setAttributedTitle:[self __titleAttributedString]];
}

-(void)setAlignment:(NSTextAlignment)alignment{
    [super setAlignment:alignment];
    [self setAttributedTitle:[self __titleAttributedString]];
}

-(void)setFont:(NSFont *)font{
    [super setFont:font];
    [self setAttributedTitle:[self __titleAttributedString]];
}

-(void)__initializeASUButton{
    [self addTrackingRect:[self bounds] owner:self userData:nil assumeInside:NO];
    [self setBezelStyle:NSRoundRectBezelStyle];
    [self setBordered:NO];
    [self setWantsLayer:YES];
    _backgroundColor = [NSColor grayColor];
    _titleColor = [NSColor blackColor];
    self.layer.backgroundColor = _backgroundColor.CGColor;
    self.layer.cornerRadius = 3.0f;
}

-(NSAttributedString *)__titleAttributedString{
    NSString *title = self.title;
    NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc] initWithString: title];
    [attributedTitle addAttribute:NSForegroundColorAttributeName value:_titleColor range:NSMakeRange(0, [title length])];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:self.alignment];
    [attributedTitle addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [title length])];
    [attributedTitle addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [title length])];
    return attributedTitle;
}

@end
