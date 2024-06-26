//
//  ViewController.h
//  Golf
//
//  Created by Titov, Aleksandr on 1/22/20.
//  Copyright © 2020 Titov, Aleksandr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
#define speedScale 0.20
#define stopSpeed 5.0
@property (strong, nonatomic) IBOutlet UIImageView *hole;
@property (strong, nonatomic) IBOutlet UIImageView *ball;
@property (strong, nonatomic) IBOutlet UIImageView *leftWall;
@property (strong, nonatomic) IBOutlet UIImageView *rightWall;
@property (strong, nonatomic) IBOutlet UIImageView *topWall;
@property (strong, nonatomic) IBOutlet UIImageView *bottomWall;
@property (strong, nonatomic) IBOutlet UIImageView *leftRiver;
@property (strong, nonatomic) IBOutlet UIImageView *rightRiver;
@property (strong, nonatomic) IBOutlet UIImageView *lavaWallLeft;
@property (strong, nonatomic) IBOutlet UIImageView *lavaWallRight;
@property (strong, nonatomic) IBOutlet UIImageView *lavaPit;
@property (strong, nonatomic) IBOutlet UIImageView *sandPitLeft;
@property (strong, nonatomic) IBOutlet UIImageView *sandPitRight;
@property (strong, nonatomic) IBOutlet UIImageView *sandPitWallTop;
@property (strong, nonatomic) IBOutlet UIImageView *boosterLeft;
@property (strong, nonatomic) IBOutlet UIImageView *boosterRight;
@property (strong, nonatomic) IBOutlet UIImageView *hippo;

@property (nonatomic) CGPoint firstPoint;
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) float ballVelocityX;
@property (nonatomic) float ballVelocityY;
@property (nonatomic) float lastPositionX;
@property (nonatomic) float lastPositionY;
@property (nonatomic) float startPositionX;
@property (nonatomic) float startPositionY;
@property (nonatomic) double speedDamping;
@property (strong, nonatomic) NSTimer *gameTimer;
@property (nonatomic) double hippoSpeedX;
@property (nonatomic) Boolean isMoving;


@end

