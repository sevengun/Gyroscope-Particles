//
//  ViewController.h
//  Gyroscope Particles
//

//  Copyright (c) 2013 Appuccino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface ViewController : UIViewController

@property (nonatomic) AVAudioRecorder *recorder;
@property (nonatomic) NSTimer *audioTimer;
@property (nonatomic) double filteredResults;
@property (nonatomic) SKScene * scene;

@end
