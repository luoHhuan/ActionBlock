//
//  UIControl+LHActionBlocks.h
//  ActionBlock
//
//  Created by Luoh on 2017/11/13.
//  Copyright © 2017年 Luoh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHActionBlock.h"
@interface UIControl (LHActionBlocks)

- (void)handleControlEvents:(UIControlEvents)controlEvents withBlock:(LHActionBlock)actionBlock;

- (void)removeActionBlocksForControlEvents:(UIControlEvents)controlEvents;
@end
