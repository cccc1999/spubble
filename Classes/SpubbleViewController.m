//
//  SpubbleViewController.m
//  Spubble
//
//  Created by Varun  Maker on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SpubbleViewController.h"

@implementation SpubbleViewController;
@synthesize childView, bubbleScrollView,bubbleScrollView1, placesScrollView, articlesScrollView, pronounsScrollView, foodScrollView, greetingsScrollView;
@synthesize hackathonScrollView, numbersScrollView;
@synthesize playlist;
//@synthesize managedObjectContext;





- (IBAction) switchToHome:(id)sender {
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.25];
	childView.alpha = 0;
	//[childView removeFromSuperview];
	
	self.bubbleScrollView1.contentSize = CGSizeMake(57*[imageViewArray count], 57);
	CGFloat xOrigin=0.0;
	UIButton *btn1;
	if([imageViewArray count]>0){
		btn1 = [imageViewArray objectAtIndex:0];
		//CGRect btnRect = btn1.frame;
		//CGFloat xOrigin=0.0;
		xOrigin=0;
	
	for(int j=0; j<[imageViewArray count]; j++){
		//UIButton* btn2=[imageViewArray objectAtIndex:j];
		[[imageViewArray objectAtIndex:j] setFrame:CGRectMake(xOrigin, 15, btn1.frame.size.width, btn1.frame.size.height)];
		[[imageViewArray objectAtIndex:j] removeTarget:self action:@selector(deleteView:) forControlEvents:UIControlEventTouchUpOutside];
		[[imageViewArray objectAtIndex:j] addTarget:self action:@selector(deleteView1:) forControlEvents:UIControlEventTouchUpOutside];
		xOrigin=xOrigin+btn1.frame.size.width;
		//[bubbleScrollView1 addSubview:btn2];
		[bubbleScrollView1 addSubview:[imageViewArray objectAtIndex:j]];
		
	}
	}
	//[btn1 release];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (IBAction) playa1:(id)sender {
	UIButton *btn=((UIButton*) sender);
	NSString* audioname =  [NSString stringWithFormat:@"%d", btn.tag];
	//NSLog(audioname);

	player = [[AVAudioPlayer alloc]
			   initWithContentsOfURL:[NSURL fileURLWithPath:
									  [[NSBundle mainBundle] pathForResource:audioname ofType:@"m4a"]]
			   error:nil];
	
	[player setDelegate:self];
	[player prepareToPlay];
	[player play];
	
	playingSingleWord = YES;
	
}
-(IBAction)switchToSelectedView:(id)sender {
	
	placesScrollView.hidden=YES; articlesScrollView.hidden=YES; pronounsScrollView.hidden=YES; greetingsScrollView.hidden=YES;
	numbersScrollView.hidden=YES; foodScrollView.hidden=YES; hackathonScrollView.hidden=YES;
	
	placesScrollView.alpha=0; articlesScrollView.alpha=0; pronounsScrollView.alpha=0; foodScrollView.alpha=0;
	numbersScrollView.alpha=0; greetingsScrollView.alpha=0; hackathonScrollView.alpha=0;
	
	childView.alpha = 0;
	[self.view addSubview:childView];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.25];
	childView.alpha = 1;
	
	NSString *theTitle = [sender titleForState:UIControlStateNormal];
	UIButton *btn=((UIButton*) sender);
	int tag = btn.tag;
	if(tag == 3) {
		foodScrollView.hidden = NO;
		foodScrollView.alpha = 1;
	}
	else if(tag == 2) {
		placesScrollView.alpha = 1;
		placesScrollView.hidden = NO;
	}
	else if(tag == 0) {
		hackathonScrollView.alpha = 1;
		hackathonScrollView.hidden = NO;
	}
	else if(tag == 1) {
		numbersScrollView.alpha = 1;
		numbersScrollView.hidden = NO;
	}
	else if(tag == 4) {
		articlesScrollView.alpha = 1;
		articlesScrollView.hidden = NO;
	}
	UIButton *btn1;
	CGFloat xOrigin=0.0;
	if([imageViewArray count]>0){
		btn1 = [imageViewArray objectAtIndex:0];
		CGRect btnRect = btn1.frame;
		//CGFloat xOrigin=0.0;
		xOrigin=0;
		
		for(int j=0; j<[imageViewArray count]; j++){
			UIButton* btn2=[imageViewArray objectAtIndex:j];
			[[imageViewArray objectAtIndex:j] setFrame:CGRectMake(xOrigin, 0, btn1.frame.size.width, btn1.frame.size.height)];
			[[imageViewArray objectAtIndex:j] removeTarget:self action:@selector(deleteView1:) forControlEvents:UIControlEventTouchUpOutside];
			[[imageViewArray objectAtIndex:j] addTarget:self action:@selector(deleteView:) forControlEvents:UIControlEventTouchUpOutside];
			xOrigin=xOrigin+btn1.frame.size.width;
			[bubbleScrollView addSubview:[imageViewArray objectAtIndex:j]];
			//[bubbleScrollView1 addSubview:[imageViewArray objectAtIndex:j]];
			
		}
	}
	[UIView commitAnimations];
	
}
- (IBAction) playButton: (id)sender {
	
	playingSingleWord = NO;
	
	if( [playlist count] > 0 ) {
		audioCounter = 0;
		AVAudioPlayer *player1 = [playlist objectAtIndex:0];
		[player1 setDelegate:self];
		[player1 play];
		//[player1 release];
		
	}
	
	
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
	
	if( playingSingleWord ) {
		[player release];
		player = nil;
	}
	else {
		

	audioCounter++;
	
	if( [playlist count] > audioCounter ) {
		AVAudioPlayer *player1 = [playlist objectAtIndex:audioCounter];
		[player1 setDelegate:self];
		[player1 play];
	}
		
	}

}

-(IBAction)deleteView:(id)sender {
	UIButton *btn=((UIButton*) sender);
	NSInteger location=0;
	location = [imageViewArray indexOfObject:((UIButton*) sender)];
			[imageViewArray removeObjectAtIndex:location];
			[playlist removeObjectAtIndex:location];
			[((UIButton*) sender) removeFromSuperview];
	CGFloat xOrigin=0.0;
	UIButton *btn1;
	if(location>0){
	btn1 = [imageViewArray objectAtIndex:location-1];
	CGRect btnRect = btn1.frame;
	//CGFloat xOrigin=0.0;
	xOrigin=btn1.frame.size.width*(location);
	}
	else {
		 xOrigin=0.0;
	}
	for(int j=location; j<[imageViewArray count]; j++){
		[[imageViewArray objectAtIndex:j] setFrame:CGRectMake(xOrigin, 0, btn.frame.size.width, btn.frame.size.height)];
		xOrigin=xOrigin+btn.frame.size.width;
		[bubbleScrollView addSubview:[imageViewArray objectAtIndex:j]];
		//[bubbleScrollView1 addSubview:[imageViewArray objectAtIndex:j]];
		
	}

	
	//NSLog(@"abc", imageViewArray.count);
}
-(IBAction)deleteView1:(id)sender {
	UIButton *btn=((UIButton*) sender);
	NSInteger location=0;
	location = [imageViewArray indexOfObject:((UIButton*) sender)];
	[imageViewArray removeObjectAtIndex:location];
	[playlist removeObjectAtIndex:location];
	[((UIButton*) sender) removeFromSuperview];
	CGFloat xOrigin=0.0;
	UIButton *btn1;
	if(location>0){
		btn1 = [imageViewArray objectAtIndex:location-1];
		CGRect btnRect = btn1.frame;
		//CGFloat xOrigin=0.0;
		xOrigin=btn1.frame.size.width*(location);
	}
	else {
		xOrigin=0.0;
	}
	for(int j=location; j<[imageViewArray count]; j++){
		[[imageViewArray objectAtIndex:j] setFrame:CGRectMake(xOrigin, 15, btn.frame.size.width, btn.frame.size.height)];
		xOrigin=xOrigin+btn.frame.size.width;
		[bubbleScrollView1 addSubview:[imageViewArray objectAtIndex:j]];
		//[bubbleScrollView1 addSubview:[imageViewArray objectAtIndex:j]];
		
	}
	
	
	//NSLog(@"abc", imageViewArray.count);
}

- (IBAction) addToBubble1:(id)sender {
	
	if (!imageViewArray) {
		imageViewArray = [[NSMutableArray alloc] init];
	}
	if(!playlist){
		playlist = [[NSMutableArray alloc] init];
	}
	
	//CGRect frame = sender.currentImage.frame;
	UIImage *image = [sender imageForState:UIControlStateNormal];
	UIView *imageView = [[UIImageView alloc] initWithImage:image];

	//AVAudioPlayer *player = [[AVAudioPlayer alloc] 
	UIButton *btn=((UIButton*) sender);
	NSString* audioname =  [NSString stringWithFormat:@"%d", btn.tag];
	player = [[AVAudioPlayer alloc]
			  initWithContentsOfURL:[NSURL fileURLWithPath:
									 [[NSBundle mainBundle] pathForResource:audioname ofType:@"m4a"]]
			  error:nil];
	//sender.tag==1
	[player prepareToPlay];
	[playlist addObject:player];
	[player release];
	
	CGFloat xOrigin = 0.0;
	if( [imageViewArray count] ) {
		UIView *lastView = [imageViewArray lastObject];
		xOrigin =lastView.frame.size.width*([imageViewArray count]);
	}
	
	
	//[imageView addTarget:self action:@selector(deleteView:) forControlEvents:UIControlEventTouchUpOutside];
	//imageView.userInteractionEnabled=YES;
	
	imageView.frame = CGRectMake(xOrigin, 0, imageView.frame.size.width, imageView.frame.size.height);
	self.bubbleScrollView.contentSize = CGSizeMake(xOrigin+imageView.frame.size.width, 57);
	//self.bubbleScrollView1.contentSize = CGSizeMake(xOrigin+imageView.frame.size.width, 57);
	//[self.bubbleScrollView addSubview:imageView];
	btn = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn setFrame:CGRectMake(xOrigin, 0, 57, 57)];
	[btn setImage:image forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(deleteView:) forControlEvents:UIControlEventTouchUpOutside];
	//[btn addTarget:self action:@selector(deleteView1:) forControlEvents:UIControlEventTouchUpOutside];
	[self.bubbleScrollView addSubview:btn];
	//[self.bubbleScrollView1 addSubview:btn];
	[imageViewArray addObject:btn];
	[imageView release];
}
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
	 placesScrollView.contentSize = CGSizeMake(1500, 80);
	 placesScrollView.pagingEnabled = YES;
	 articlesScrollView.contentSize = CGSizeMake(1080, 80);
	 articlesScrollView.pagingEnabled = YES;
	 foodScrollView.contentSize = CGSizeMake(720, 80);
	 foodScrollView.pagingEnabled = YES;
	  numbersScrollView.contentSize = CGSizeMake(720, 80);
	 numbersScrollView.pagingEnabled = YES;
	  hackathonScrollView.contentSize = CGSizeMake(1080, 80);
	 hackathonScrollView.pagingEnabled = YES;
	 [self rateApp];
	 [super viewDidLoad];
 }
	
-(void)rateApp {
	 
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setBool:NO forKey:@"appAskedForRating"];
	if (! [defaults objectForKey:@"appFirstRun"]) {
		[defaults setObject:[NSDate date] forKey:@"appFirstRun"];
	}
	
	NSInteger daysSinceInstall = [[NSDate date] timeIntervalSinceDate:[defaults objectForKey:@"appFirstRun"]] / 5;
	if (/*daysSinceInstall > 1 &&*/ [defaults boolForKey:@"appAskedForRating"] == NO) {
		UIActionSheet *pickOption = [[UIActionSheet alloc] 
									 initWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" 
									 delegate:self cancelButtonTitle:@"Proceed Without Rating" 
									 destructiveButtonTitle:nil 
									 otherButtonTitles:@"Rate App", @"Buy App", nil];
		
		pickOption.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
		
		UIImage *rateScreenImg = [UIImage imageNamed:@"icon.png"];
		UIImageView *rateScreenView = [[UIImageView alloc] initWithImage:rateScreenImg];
		
		rateScreenView.frame = CGRectMake(25, 25, 200, 150);
		[pickOption addSubview:rateScreenView];	
		[rateScreenView release];
		
		[pickOption showInView:self.view];	
		[pickOption release];
		[defaults setBool:NO forKey:@"appAskedForRating"];
	}
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	//[bubbleScrollView release];
	[player release];
	//[imageViewArray release];
    [super dealloc];
}


@end

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */






