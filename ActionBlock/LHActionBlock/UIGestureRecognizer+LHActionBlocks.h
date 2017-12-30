//
//  UIGestureRecognizer+LHActionBlocks.h
//  ActionBlock
//
//  Created by Luoh on 2017/11/13.
//  Copyright © 2017年 Luoh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHActionBlock.h"


@interface UIGestureRecognizer (LHActionBlocks)

- (instancetype)initWithBlock:(LHActionBlock)actionBlock;

- (void)setBlock:(LHActionBlock)actionBlock;

@end
