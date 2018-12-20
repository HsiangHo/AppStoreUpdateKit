//
//  ASUView.m
//  AppStoreUpdateKit
//
//  Created by Jovi on 12/20/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import "ASUView.h"

@implementation ASUView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    //// General Declarations
    CGContextRef context = NSGraphicsContext.currentContext.CGContext;
    
    //// Color Declarations
    NSColor* color2 = [NSColor colorWithRed: 1 green: 0.357 blue: 0.357 alpha: 1];
    
    //// Shadow Declarations
    NSShadow* shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [NSColor.lightGrayColor colorWithAlphaComponent: 0.55];
    shadow.shadowOffset = NSMakeSize(0, 1);
    shadow.shadowBlurRadius = 1;
    NSShadow* shadow2 = [[NSShadow alloc] init];
    shadow2.shadowColor = [NSColor.lightGrayColor colorWithAlphaComponent: 0.4];
    shadow2.shadowOffset = NSMakeSize(-1, 2);
    shadow2.shadowBlurRadius = 1;
    
    //// Rectangle Drawing
    NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect: NSMakeRect(0, -1, 320, 244)];
    [[NSColor whiteColor] setFill];
    [rectanglePath fill];
    
    
    //// Oval Drawing
    [NSGraphicsContext saveGraphicsState];
    CGContextTranslateCTM(context, 320.36, 241.95);
    CGContextRotateCTM(context, -90.22 * M_PI/180);
    
    NSRect ovalRect = NSMakeRect(-241.89, -273.62, 483.79, 547.25);
    NSBezierPath* ovalPath = [NSBezierPath bezierPath];
    [ovalPath appendBezierPathWithArcWithCenter: NSMakePoint(0, 0) radius: ovalRect.size.width / 2 startAngle: -90 endAngle: 180 clockwise: YES];
    [ovalPath lineToPoint: NSMakePoint(0, 0)];
    [ovalPath closePath];
    
    NSAffineTransform* ovalTransform = [NSAffineTransform transform];
    [ovalTransform translateXBy: NSMidX(ovalRect) yBy: NSMidY(ovalRect)];
    [ovalTransform scaleXBy: 1 yBy: ovalRect.size.height / ovalRect.size.width];
    [ovalPath transformUsingAffineTransform: ovalTransform];
    
    [NSGraphicsContext saveGraphicsState];
    [shadow set];
    [[NSColor whiteColor] setFill];
    [ovalPath fill];
    [NSGraphicsContext restoreGraphicsState];
    
    
    [NSGraphicsContext restoreGraphicsState];
    
    
    //// Oval 2 Drawing
    [NSGraphicsContext saveGraphicsState];
    CGContextSetAlpha(context, 0.7);
    CGContextBeginTransparencyLayer(context, NULL);
    
    NSBezierPath* oval2Path = [NSBezierPath bezierPath];
    [oval2Path moveToPoint: NSMakePoint(0, 471)];
    [oval2Path curveToPoint: NSMakePoint(208, 243) controlPoint1: NSMakePoint(114.88, 471) controlPoint2: NSMakePoint(208, 368.92)];
    [oval2Path lineToPoint: NSMakePoint(0, 243)];
    [oval2Path lineToPoint: NSMakePoint(0, 471)];
    [oval2Path closePath];
    [NSGraphicsContext saveGraphicsState];
    [shadow2 set];
    [[NSColor whiteColor] setFill];
    [oval2Path fill];
    [NSGraphicsContext restoreGraphicsState];
    
    
    CGContextEndTransparencyLayer(context);
    [NSGraphicsContext restoreGraphicsState];
    
    
    //// Oval 3 Drawing
    [NSGraphicsContext saveGraphicsState];
    CGContextSetAlpha(context, 0.4);
    CGContextBeginTransparencyLayer(context, NULL);
    
    NSBezierPath* oval3Path = [NSBezierPath bezierPath];
    [oval3Path moveToPoint: NSMakePoint(46, 244.03)];
    [oval3Path curveToPoint: NSMakePoint(320.31, 484.85) controlPoint1: NSMakePoint(46.52, 377.62) controlPoint2: NSMakePoint(169.34, 485.44)];
    [oval3Path lineToPoint: NSMakePoint(319.36, 242.95)];
    [oval3Path lineToPoint: NSMakePoint(46, 244.03)];
    [oval3Path closePath];
    [NSGraphicsContext saveGraphicsState];
    [shadow set];
    [[NSColor whiteColor] setFill];
    [oval3Path fill];
    [NSGraphicsContext restoreGraphicsState];
    
    
    CGContextEndTransparencyLayer(context);
    [NSGraphicsContext restoreGraphicsState];
    
    
    //// Rectangle 2 Drawing
    [NSGraphicsContext saveGraphicsState];
    CGContextTranslateCTM(context, 322.5, 434.5);
    CGContextRotateCTM(context, 45 * M_PI/180);
    
    NSBezierPath* rectangle2Path = [NSBezierPath bezierPathWithRect: NSMakeRect(0, 0, 21.92, 79.9)];
    [NSGraphicsContext saveGraphicsState];
    [shadow2 set];
    [color2 setFill];
    [rectangle2Path fill];
    [NSGraphicsContext restoreGraphicsState];
    
    
    [NSGraphicsContext restoreGraphicsState];
    
    
    //// Text Drawing
    [NSGraphicsContext saveGraphicsState];
    CGContextTranslateCTM(context, 285.35, 479.35);
    CGContextRotateCTM(context, -405 * M_PI/180);
    
    NSRect textRect = NSMakeRect(0, 0, 45.25, 12.23);
    {
        NSString* textContent = @"New";
        NSMutableParagraphStyle* textStyle = [[NSMutableParagraphStyle alloc] init];
        textStyle.alignment = NSCenterTextAlignment;
        NSDictionary* textFontAttributes = @{NSFontAttributeName: [NSFont systemFontOfSize: NSFont.systemFontSize], NSForegroundColorAttributeName: NSColor.whiteColor, NSParagraphStyleAttributeName: textStyle};
        
        CGFloat textTextHeight = [textContent boundingRectWithSize: textRect.size options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes].size.height;
        NSRect textTextRect = NSMakeRect(NSMinX(textRect), NSMinY(textRect) + (textRect.size.height - textTextHeight) / 2, textRect.size.width, textTextHeight);
        [NSGraphicsContext saveGraphicsState];
        NSRectClip(textRect);
        [textContent drawInRect: NSOffsetRect(textTextRect, 0, 0.5) withAttributes: textFontAttributes];
        [NSGraphicsContext restoreGraphicsState];
    }
    
    [NSGraphicsContext restoreGraphicsState];

}

@end
