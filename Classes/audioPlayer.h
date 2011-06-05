//
//  audioPlayer.h
//  Spubble
//
//  Created by Cheng Chen on 11/10/10.
//  Copyright 2010 university of michigan. All rights reserved.
//

#import <CoreData/CoreData.h>

#import <AVFoundation/AVFoundation.h>

@interface audioPlayer :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) AVAudioPlayer *audio;

@end



