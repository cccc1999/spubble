//
//  SpubbleViewController.h
//  Spubble
//
//  Created by Varun  Maker on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreData/CoreData.h>

@interface SpubbleViewController : UIViewController {
	UIScrollView *bubbleScrollView;
	UIScrollView *bubbleScrollView1;
	NSMutableArray *imageViewArray;
	NSMutableArray *playlist;
	UIView *childView;
	UIScrollView *placesScrollView;
	UIScrollView *articlesScrollView;
	UIScrollView *pronounsScrollView;
	UIScrollView *foodScrollView;
	UIScrollView *greetingsScrollView;
	UIScrollView *hackathonScrollView; 
	UIScrollView *numbersScrollView;
	int audioCounter;
	AVAudioPlayer *player;

	BOOL playingSingleWord;
	
}

@property (retain, nonatomic) IBOutlet UIView *childView;
@property (retain, nonatomic) IBOutlet NSMutableArray *playlist;
@property (retain, nonatomic) IBOutlet UIScrollView *bubbleScrollView;
@property (retain, nonatomic) IBOutlet UIScrollView *bubbleScrollView1;
@property (retain, nonatomic) IBOutlet UIScrollView *numbersScrollView;
@property (retain, nonatomic) IBOutlet UIScrollView *placesScrollView;
@property (retain, nonatomic) IBOutlet UIScrollView *articlesScrollView;
@property (retain, nonatomic) IBOutlet UIScrollView *pronounsScrollView;
@property (retain, nonatomic) IBOutlet UIScrollView *foodScrollView;
@property (retain, nonatomic) IBOutlet UIScrollView *greetingsScrollView;
@property (retain, nonatomic) IBOutlet UIScrollView *hackathonScrollView;

-(IBAction)switchToHome:(id)sender;
-(IBAction)switchToSelectedView:(id)sender;
-(IBAction)addToBubble1:(id)sender;
-(IBAction) playButton: (id)sender;
-(IBAction) playa1:(id)sender;
/*-(IBAction)addToBubble2:(id)sender;
-(IBAction)addToBubble3:(id)sender;
-(IBAction)addToBubble4:(id)sender;
-(IBAction)addToBubble5:(id)sender;
-(IBAction)addToBubble6:(id)sender;
-(IBAction)addToBubble7:(id)sender;
-(IBAction)addToBubble8:(id)sender;
-(IBAction)addToBubble9:(id)sender;
 */
-(IBAction)deleteView:(id)sender;
-(IBAction)deleteView1:(id)sender;


@end

