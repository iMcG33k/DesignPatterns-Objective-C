//
//  ILeiFeng.h
//  DesignPatterns
//
//  工厂模式
//  与简单工厂模式不同之处：简单模式可以使用继承，调用工厂对象生成指定对象，但如果增加新的对象，又需要增加对类型的判断，破坏了开放-封闭原则。而工厂模式采用接口（协议）来实现多个类的产生，自定义类就更加方便了，只要实现指定的接口即可。
//  UIKit中MKAnnotation就是工厂模式。
//  工厂方法模式实现时，客户端需要决定实例化哪一个工厂来实现运算类，选择判断的问题还是存在的，也就是说，工厂方法把简单的内部逻辑判断移到了客户端代码来进行。你想要加功能，本来是该工厂类的，而现在是修改客户端
//  Created by leichunfeng on 14-10-19.
//  Copyright (c) 2014年 zdnst. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 雷锋接口
@protocol ILeiFeng <NSObject>

/// 扫地
- (void)sweep;

/// 洗衣
- (void)wash;

/// 买米
- (void)buyRice;

@end
