//
//  SnakeView.h
//  SillySnake
//
//  Created by Annie Lee on 2019/1/24.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Snake.h"

@class SnakeView;

NS_ASSUME_NONNULL_BEGIN

@protocol SnakeViewDelegate <NSObject>
- (NSArray*)snakeBodyForSnakeView:(SnakeView *)view;
- (NSValue*)fruitForSnakeView:(SnakeView *)view;
- (void)snakeView:(SnakeView *)view didChangeDirection:(SnakeDirection)direction;
@end

@interface SnakeView : UIView

@property (weak, nonatomic) id <SnakeViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
