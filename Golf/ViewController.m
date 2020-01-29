//
//  ViewController.m
//  Golf
//
//  Created by Titov, Aleksandr on 1/22/20.
//  Copyright © 2020 Titov, Aleksandr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize ball, hole, hippo, firstPoint, lastPoint, leftWall, rightWall, topWall, bottomWall, lastPositionX, lastPositionY, leftRiver, rightRiver, lavaWallLeft, lavaWallRight, sandPitWallTop, boosterLeft, boosterRight, lavaPit, sandPitLeft, sandPitRight, hippoSpeedX;
- (void)viewDidLoad {
  [super viewDidLoad];
  // changes hole image to be circular
  self.hole.layer.cornerRadius = .5*self.hole.layer.frame.size.height;
  self.hole.layer.masksToBounds = YES;
    self.startPositionX = self.ball.center.x;
    self.startPositionY = self.ball.center.y;
    self.speedDamping = 0.9;
    self.hippoSpeedX = 0.1;
    [NSTimer scheduledTimerWithTimeInterval:0.0001
    target:self
    selector:@selector(moveHippo:)
    userInfo:nil
    repeats:YES];
}









-(void)moveBall {
  // simulates friction by reducing velocity
  self.ballVelocityX = self.speedDamping * self.ballVelocityX;
  self.ballVelocityY = self.speedDamping * self.ballVelocityY;
   

    
  // this is the ball move
  self.ball.center = CGPointMake(self.ball.center.x + self.ballVelocityX, self.ball.center.y + self.ballVelocityY);
   
  // logic to calculate if ball and hole collide
  if (CGRectIntersectsRect(self.ball.frame, self.hole.frame)) {
    [self.gameTimer invalidate];
    [self.view setUserInteractionEnabled:YES];
    self.ball.center = CGPointMake(self.hole.center.x, self.hole.center.y);
    self.ball.alpha = 0.2;
  }
    
    if (CGRectIntersectsRect(self.ball.frame, self.leftRiver.frame) || CGRectIntersectsRect(self.ball.frame, self.rightRiver.frame) || CGRectIntersectsRect(self.ball.frame, self.lavaPit.frame)) {
        NSLog(@"Hit river or lava");
        self.ballVelocityY = self.ballVelocityX = 0;
        self.ball.center = CGPointMake(self.startPositionX, self.startPositionY);

    }
    
    if (CGRectIntersectsRect(self.ball.frame, self.sandPitRight.frame) || CGRectIntersectsRect(self.ball.frame, self.sandPitLeft.frame)) {
        self.speedDamping = 0.5;
    } else if (CGRectIntersectsRect(self.ball.frame, self.boosterRight.frame) || CGRectIntersectsRect(self.ball.frame, self.boosterLeft.frame)) {
        self.speedDamping = 1.1;
    } else {
        self.speedDamping = 0.9;
    }
    
    if (CGRectIntersectsRect(self.ball.frame, self.topWall.frame) || CGRectIntersectsRect(self.ball.frame, self.bottomWall.frame) || CGRectIntersectsRect(self.ball.frame, self.sandPitWallTop.frame)) {
        self.ballVelocityY = self.ballVelocityY * (-1);
        NSLog(@"Hit horizontal wall");
    }

    if (CGRectIntersectsRect(self.ball.frame, self.leftWall.frame) || CGRectIntersectsRect(self.ball.frame, self.rightWall.frame) || CGRectIntersectsRect(self.ball.frame, self.lavaWallRight.frame) || CGRectIntersectsRect(self.ball.frame, self.lavaWallLeft.frame)) {
        self.ballVelocityX = self.ballVelocityX * (-1);
        NSLog(@"Hit vertical wall");
    }

   
  // if ball slows/stops turn off game timer and turn user interaction back on
  if(fabs(self.ballVelocityX) < stopSpeed && fabs(self.ballVelocityY) < stopSpeed) {
    [self.gameTimer invalidate];
    [self.view setUserInteractionEnabled:YES];
  }
    

}

-(void)moveHippo: (NSTimer *) timer {
    NSLog(@"Hippo moved");
    self.hippo.center = CGPointMake(self.hippo.center.x + self.hippoSpeedX, self.hippo.center.y);
    if (CGRectIntersectsRect(self.hippo.frame, self.leftWall.frame) || CGRectIntersectsRect(self.hippo.frame, self.rightWall.frame)) {
        NSLog(@"Hit river or lava");
        self.hippoSpeedX *= -1;
    }
}



-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  NSLog(@"touches Ended");
   
  UITouch *touch = [touches anyObject];
   
  // store point a touch end
  self.lastPoint = [touch locationInView:self.view];

   
  // logic to calculate swipevector as distance between touch began and touch end
  CGPoint swipeVector = CGPointMake(self.lastPoint.x - self.firstPoint.x, self.lastPoint.y - self.firstPoint.y);
   
  // velocity of ball based off of swipe
  self.ballVelocityX = speedScale * swipeVector.x;
  self.ballVelocityY = speedScale * swipeVector.y;
   
  // move ball occurs multiple times at this sampling rate, until friction causes ball to stop
  self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touches Began");
    UITouch *touch = [touches anyObject];
    // turn user interaction off as swipe begins
    [self.view setUserInteractionEnabled:NO];
       
    // store point a touch began
    self.firstPoint = [touch locationInView:self.view];
    lastPositionX = self.ball.center.x;
    lastPositionY = self.ball.center.y;
   
}

@end
