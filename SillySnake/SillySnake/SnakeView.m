//
//  SnakeView.m
//  SillySnake
//
//  Created by Annie Lee on 2019/1/24.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import "SnakeView.h"
#import "Snake.h"

@interface SnakeView ()
{
    NSInteger sizeOfDot;
}
@end

@implementation SnakeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self registerSwipeGesture];
    
    sizeOfDot = 21;
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    NSValue *fruit = [self.delegate fruitForSnakeView:self];
    
    NSArray *body = [self.delegate snakeBodyForSnakeView:self];

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    CGContextSetLineWidth(context, 5);
    
    CGContextFillRect(context, rect);
    CGContextStrokeRect(context, rect);
    
    for (int i = 0; i < [body count]; i++) {
        
        Dot dot;
        
        [body[i] getValue:&dot];
        
        CGContextAddRect(context, CGRectMake(dot.x*sizeOfDot, dot.y*sizeOfDot, sizeOfDot-1, sizeOfDot-1));

        [[UIColor colorWithRed:0 green:0 blue:0 alpha:1] set];

        CGContextFillPath(context);
    }
    
    Dot fruitDot;
    
    [fruit getValue:&fruitDot];

    CGContextAddRect(context, CGRectMake(fruitDot.x*sizeOfDot, fruitDot.y*sizeOfDot, sizeOfDot-1, sizeOfDot-1));
    
    [[UIColor colorWithRed:1 green:0 blue:0 alpha:1] set];
    
    CGContextFillPath(context);
}

- (void)registerSwipeGesture {
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(didSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]  initWithTarget:self action:@selector(didSwipe:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipeDown];
}

- (void)didSwipe:(UISwipeGestureRecognizer*)swipe {
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        [self.delegate snakeView:self didChangeDirection:SnakeDirectionLeft];
        
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        
        [self.delegate snakeView:self didChangeDirection:SnakeDirectionRight];
        
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
        
        [self.delegate snakeView:self didChangeDirection:SnakeDirectionUp];
        
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionDown) {
        
        [self.delegate snakeView:self didChangeDirection:SnakeDirectionDown];
    }
}

@end
