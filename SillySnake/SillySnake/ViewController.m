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
@property UIView *startView;
@property CGRect windowRect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.windowRect = [[UIScreen mainScreen] bounds];
    
    [self addStartView];
}

- (void)addStartView {
    
    self.startView = [[UIView alloc] initWithFrame:self.windowRect];
    
    [self.startView setBackgroundColor:[UIColor blackColor]];
    
    UIButton *button = [self createStartButton];
    
    [self.startView addSubview:button];
    
    [self.view addSubview:self.startView];
}

- (void)addSnakeView {
    
    self.snakeView = [[SnakeView alloc] initWithFrame:self.windowRect];
    
    self.snakeView.delegate = self;
        
    [self.view addSubview:self.snakeView];
}

- (UIButton*)createStartButton {
    
    CGSize size = self.windowRect.size;
    
    CGRect buttonFrame = CGRectMake( size.width/3, size.height/3, size.width/3, size.height/5 );
    
    UIButton *button = [[UIButton alloc] initWithFrame: buttonFrame];
    
    [button setTitle:@"START" forState:UIControlStateNormal];
    
    [button setBackgroundColor:[UIColor grayColor]];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button addTarget:self
               action:@selector(startButtonClicked:)
     forControlEvents:UIControlEventTouchUpInside
     ];
    
    return button;
}

- (void)startButtonClicked:(UIButton*)sender {
    
    CGSize size = self.windowRect.size;
    
    self.snake = [[Snake alloc] initWithDirection:LEFT maxX:size.width/21-1 maxY:size.height/21-1 length:2];
    
    [self addSnakeView];
    
    [self.startView removeFromSuperview];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
}

- (void)updateTime:(NSTimer *)timer {
    
    bool added = [self.snake move];
    
    [self.snakeView setNeedsDisplay];
    
    if (!added) {
        
        [self.timer invalidate];
        
        self.timer = nil;
        
        [self addStartView];
        
        [self.snakeView removeFromSuperview];
        
        self.snake = nil;
    }
}

#pragma mark - SnakeViewDelegate

- (nonnull NSMutableArray *)getSnake:(nonnull SnakeView *)view {

    return [self.snake getSnakeBody];
}

- (nonnull NSValue *)getFruit:(nonnull SnakeView *)view {
    
    return [self.snake getFruit];
}

- (void)changeDirection:(SnakeView *)view to:(SnakeDirection)direction {
    
    [self.snake changeDirection:direction];
}

@end
