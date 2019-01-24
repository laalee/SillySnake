//
//  SnakeView.h
//  SillySnake
//
//  Created by Annie Lee on 2019/1/24.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SnakeView;

NS_ASSUME_NONNULL_BEGIN

@protocol SnakeViewDelegate
- (NSMutableArray*)getBody:(SnakeView *)view;
- (NSValue*)getFruit:(SnakeView *)view;
@end

@interface SnakeView : UIView
@property (weak, nonatomic) id <SnakeViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
