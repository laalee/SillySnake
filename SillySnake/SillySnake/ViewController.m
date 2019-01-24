//
//  ViewController.m
//  SillySnake
//
//  Created by Annie Lee on 2019/1/22.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import "ViewController.h"
#import "Snake.h"
#import "SnakeView.h"

@interface ViewController ()

@property SnakeView *snakeView;
@property Snake *snake;
@property NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect windowRect = [[UIScreen mainScreen] bounds];
    self.snakeView = [[SnakeView alloc] initWithFrame:windowRect];
    self.snakeView.delegate = self;
    [self.view addSubview:self.snakeView];
    
    self.snake = [[Snake alloc] initWithDirection:LEFT maxX:windowRect.size.width/21 maxY:windowRect.size.height/21 length:2];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    
    [self registerGesture];
}

- (void)updateTime:(NSTimer *)timer {
    bool added = [self.snake move];
    [self.snakeView setNeedsDisplay];
    
    if (!added) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)registerGesture {
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.snakeView addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(didSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.snakeView addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]  initWithTarget:self action:@selector(didSwipe:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.snakeView addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.snakeView addGestureRecognizer:swipeDown];
}

- (void)didSwipe:(UISwipeGestureRecognizer*)swipe {
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self.snake changeDirection:LEFT];
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        [self.snake changeDirection:RIGHT];
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
        [self.snake changeDirection:UP];
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionDown) {
        [self.snake changeDirection:DOWN];
    }
}

#pragma mark - SnakeViewDelegate

- (nonnull NSMutableArray *)getSnake:(nonnull SnakeView *)view {

    return self.snake.body;
}

- (nonnull NSValue *)getFruit:(nonnull SnakeView *)view {
    
    return self.snake.fruit;
}

@end
