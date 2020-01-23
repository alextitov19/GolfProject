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
#define speedDamping 0.90
#define stopSpeed 5.0
@property (strong, nonatomic) IBOutlet UIImageView *hole;
@property (strong, nonatomic) IBOutlet UIImageView *ball;
@property (strong, nonatomic) IBOutlet UIImageView *leftWall;
@property (strong, nonatomic) IBOutlet UIImageView *rightWall;
@property (strong, nonatomic) IBOutlet UIImageView *topWall;
@property (strong, nonatomic) IBOutlet UIImageView *bottomWall;
@property (nonatomic) CGPoint firstPoint;
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) float ballVelocityX;
@property (nonatomic) float ballVelocityY;
@property (strong, nonatomic) NSTimer *gameTimer;

@end

