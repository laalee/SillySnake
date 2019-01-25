//
//  SnakeView.m
//  SillySnake
//
//  Created by Annie Lee on 2019/1/24.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import "SnakeView.h"
#import "Snake.h"

@implementation SnakeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self registerSwipeGesture];
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    NSValue *fruit = [self.delegate getFruit:self];
    
    NSMutableArray *body = [self.delegate getSnake:self];

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    CGContextSetLineWidth(context, 5);
    
    CGContextFillRect(context, rect);
    CGContextStrokeRect(context, rect);
    
    for (int i = 0; i < [body count]; i++) {
        
        Dot dot;
        
        [body[i] getValue:&dot];
        
        CGContextAddRect(context, CGRectMake(dot.x*21, dot.y*21, 20, 20));

        [[UIColor colorWithRed:0 green:0 blue:0 alpha:1] set];

        CGContextFillPath(context);
    }
    
    Dot fruitDot;
    
    [fruit getValue:&fruitDot];

    CGContextAddRect(context, CGRectMake(fruitDot.x*21, fruitDot.y*21, 20, 20));
    
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
        
        [self.delegate changeDirection:self to:LEFT];
        
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        
        [self.delegate changeDirection:self to:RIGHT];
        
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
        
        [self.delegate changeDirection:self to:UP];
        
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionDown) {
        
        [self.delegate changeDirection:self to:DOWN];
    }
}

@end
