Gyroscope-Particles
===================
A particle system that responds to touches and device motion.

Demo Video
-------------
I recorded a demo video of exactly how this works. It can be found [here](http://youtu.be/5LT1A02dOAw "Title").

Moving The Particle Position
-------------
The particles respond to your touches by overriding `touchesBegan:` and `touchesMoved:` like this.

    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInNode:self];
    self.particle.particlePosition = location;
    
Changing the particles angle
-------------
To change the particles angle we are overriding `update:` to get the roll attitude from the device motion.

    double yaw = self.manager.deviceMotion.attitude.roll;
    self.particle.emissionAngle = yaw*2.0+COMP;
    
You may notice that we are multiplying it by 2 and performing some additional compensation so it is more noticable.
