//
//  Operation.h
//  DesignPatterns
//
//  抽象产品
//
//  Created by iMcG33k on 16/9/15.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SWOperationProtocol <NSObject>

@required
/// 操作数 numberA
@property (nonatomic, assign) CGFloat numberA;

/// 操作数 numberB
@property (nonatomic, assign) CGFloat numberB;

/// 获取运算结果
///
/// @return 运算结果
- (CGFloat)getResult;

@end
