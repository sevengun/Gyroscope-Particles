//
//  MyScene.m
//  Gyroscope Particles
//
//  Created by Gabriel Pierannunzi on 9/25/13.
//  Copyright (c) 2013 Appuccino. All rights reserved.
//

#define COMP 1.47079633

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor colorWithRed:13.0/255.0 green:22.0/255.0 blue:28.0/255.0 alpha:1.0];
        
        NSString *particlePath = [[NSBundle mainBundle]pathForResource:@"fire" ofType:@"sks"];
        self.particle = [NSKeyedUnarchiver unarchiveObjectWithFile:particlePath];
        
        self.particle.position = CGPointMake(100, 100);
        [self addChild:self.particle];
        
        self.manager = [[CMMotionManager alloc]init];
        
        if([self.manager isGyroAvailable])
        {
            if([self.manager isGyroActive] == NO)
            {
                [self.manager startDeviceMotionUpdatesUsingReferenceFrame:CMAttitudeReferenceFrameXArbitraryZVertical];
            }
        }
        else
        {
            NSLog(@"Gyroscope not Available!");
        }
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInNode:self];
    self.particle.particlePosition = CGPointMake(location.x-110, location.y-110);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInNode:self];
    self.particle.particlePosition = CGPointMake(location.x-110, location.y-110);
}

-(void)update:(CFTimeInterval)currentTime {
    double yaw = self.manager.deviceMotion.attitude.roll;
    self.particle.emissionAngle = yaw*2.0+COMP;
}

@end
