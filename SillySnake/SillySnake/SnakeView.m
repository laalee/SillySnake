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

- (void)drawRect:(CGRect)rect {
    
    NSValue *fruit = [self.delegate getFruit:self];
    
    NSMutableArray *body = [self.delegate getSnake:self];

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:50 green:50 blue:50 alpha:1].CGColor);
    CGContextFillRect(context, rect);
    
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

@end
