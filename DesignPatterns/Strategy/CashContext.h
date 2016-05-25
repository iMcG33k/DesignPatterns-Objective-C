//
//  CashContext.h
//  DesignPatterns
//  策略模式
//  在这里的策略模式使用属性(id<CashSuper>)来赋值，让使用者跟用户之间耦合度较高。
//  可以进行改进,改进通过initWithCashType:方法调用后，客户端可以不需要了解CashSuper接口了
//
//  Created by leichunfeng on 14-10-22.
//  Copyright (c) 2014年 zdnst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CashSuper.h"

typedef NS_ENUM(NSInteger, CashType) {
    CashType_Normal,
    CashType_Rebase,
    CashType_Return
};
@interface CashContext : NSObject

///  初始化方法
///
///  @param cashSuper 实现CashSuper协议的对象
///
///  @return 实例对象
- (instancetype)initWithCashSuper:(id<CashSuper>)cashSuper;

/**
 *
 *  初始化方法
 *
 *  @param type Cash类型
 *
 *  @return 实例对象
 */
- (instancetype)initWithCashType:(CashType)type;

///  获取计算结果
///
///  @return 计算结果
- (CGFloat)getResult:(CGFloat)money;

@end
