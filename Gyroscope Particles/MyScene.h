//
//  MyScene.h
//  Gyroscope Particles
//

//  Copyright (c) 2013 Appuccino. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <CoreMotion/CoreMotion.h>

@interface MyScene : SKScene

@property (nonatomic) CMMotionManager *manager;
@property (nonatomic) SKEmitterNode *particle;
@property (nonatomic) CGPoint fingerPosition;

@end
