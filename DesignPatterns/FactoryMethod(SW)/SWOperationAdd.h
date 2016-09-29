//
//  SWOperationAdd.h
//  DesignPatterns
//
//  具体产品
//
//  Created by leichunfeng on 14-10-19.
//  Copyright (c) 2014年 zdnst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWOperationProtocol.h"

/// 加法类
@interface SWOperationAdd : NSObject <SWOperationProtocol>
/// 操作数 numberA
@property (nonatomic, assign) CGFloat numberA;

/// 操作数 numberB
@property (nonatomic, assign) CGFloat numberB;

@end
