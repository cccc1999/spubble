//
//  SpubbleAppDelegate.h
//  Spubble
//
//  Created by Varun  Maker on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpubbleViewController;


@interface SpubbleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SpubbleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SpubbleViewController *viewController;

@end

