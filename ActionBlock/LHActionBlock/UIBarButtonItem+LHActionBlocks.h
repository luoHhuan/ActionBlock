//
//  UIBarButtonItem+LHActionBlocks.h
//  ActionBlock
//
//  Created by Luoh on 2017/11/13.
//  Copyright © 2017年 Luoh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIControl+LHActionBlocks.h"
#import "LHActionBlock.h"
@interface UIBarButtonItem (LHActionBlocks)

- (instancetype)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem block:(LHActionBlock)actionBlock;

- (instancetype)initWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style block:(LHActionBlock)actionBlock;

- (instancetype)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style block:(LHActionBlock)actionBlock;

- (instancetype)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style block:(LHActionBlock)actionBlock;

- (void)setBlock:(LHActionBlock)actionBlock;

@end
