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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect windowRect = [[UIScreen mainScreen] bounds];
    self.snakeView = [[SnakeView alloc] initWithFrame:windowRect];
    self.snakeView.delegate = self;
    [self.view addSubview:self.snakeView];
}

#pragma mark - SnakeViewDelegate

- (nonnull NSMutableArray *)getBody:(nonnull SnakeView *)view {
    NSMutableArray *body = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        [body addObject:[self createDotWithX:10+i y:10]];
    }
    
    return body;
}

- (nonnull NSValue *)getFruit:(nonnull SnakeView *)view {
    NSValue *fruit = [self createDotWithX:10 y:20];
    
    return fruit;
}

- (NSValue*)createDotWithX:(int)x y:(int)y {
    
    Dot dot;
    dot.x = x;
    dot.y = y;
    
    NSValue *nsValue = [NSValue valueWithBytes:&dot objCType:@encode(Dot)];
    
    return nsValue;
}

@end
