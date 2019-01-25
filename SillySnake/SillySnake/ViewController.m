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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addStartView];
}

- (void)addStartView {
    
    CGRect windowRect = [[UIScreen mainScreen] bounds];
    
    UIButton *button = [self createStartButtonWithRect:windowRect];
    
    self.startView = [[UIView alloc] initWithFrame:windowRect];
    
    [self.startView setBackgroundColor:[UIColor blackColor]];
    
    [self.startView addSubview:button];
    
    [self.view addSubview:self.startView];
}

- (UIButton*)createStartButtonWithRect:(CGRect)rect {
    
    CGSize size = rect.size;
    
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
    
    CGSize size = self.view.safeAreaLayoutGuide.layoutFrame.size;

    int maxX = size.width / 21 - 1;
    int maxY = size.height / 21 - 1;
    
    self.snake = [[Snake alloc] initWithDirection:LEFT maxX:maxX maxY:maxY length:2];
    
    [self addSnakeView];
    
    [self.startView removeFromSuperview];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
}

- (void)addSnakeView {
    
    CGRect rect = self.view.safeAreaLayoutGuide.layoutFrame;
    
    self.snakeView = [[SnakeView alloc] initWithFrame:rect];
    
    self.snakeView.delegate = self;
    
    [self.view addSubview:self.snakeView];
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
