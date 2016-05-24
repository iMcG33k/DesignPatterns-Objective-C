//
//  IUser.h
//  DesignPatterns
//
//  抽象工厂:在实例层使用工厂方法定义统一接口，在工厂层也使用工厂方法定义统一接口，这样可以通过给两个接口添加方法来增加或者删除实例方法，工厂方法。弊端就是增删实例层时，在实现实例层对象，工厂对象中都得做相应的修改，这样做了大批量的改动，显然是非常丑陋的做法。
//  改进方法：
//  1.用简单工厂来改进抽象工厂
//  2.用反射+抽象工厂的数据访问程序
//  3.用反射+配置文件实现数据访问程序
//  Created by leichunfeng on 14-10-19.
//  Copyright (c) 2014年 zdnst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

/// 用于访问用户的接口
@protocol IUser <NSObject>

/// 新增用户
///
/// @param user 用户对象
- (void)insert:(User *)user;

/// 获取用户
///
/// @param userId 用户 id
///
/// @return 用户对象
- (User *)getUser:(NSString *)userId;

@end
