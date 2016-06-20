//
//  Command.swift
//  DesignPatterns
//
//  Created by zmj27404 on 16/6/20.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//
//  命令模式(Command)，将一个请求封装为一个对象，从而使你可用不同的请求对客户进行参数化；对请求排队或记录请求日志，以及支持可撤销的操作
//  命令模式的优点:
//  第一，它能教容易地设计一个命令队列；第二，在需要的情况下，可以较容易地将命令记录日志；第三，允许接收请求的一方决定是否要否决请求
//  第四，可以容易滴实现队请求的撤销和重做；第五，由于加进新的具体命令类不影响其他的类，一次增加新的命令类很容易。命令模式把请求一个操作的对象与知道怎么执行一个操作的对象分隔开
//  敏捷开发原则告诉我们，不要为代码添加基于猜想的、实际不需要的功能。如果不清楚一个系统是否需要命令模式，一般就不要着急去实现它，事实上，在需要的时候通过重构实现这个模式并不困难，只有在真正需要如撤销/恢复操作等功能时，把原来的代码重构为命令才有意义

import Foundation
//  增加撤销功能

/// 执行对象
public class Receiver {
    public func Action() {
        print("执行请求!")
    }
}

/// 命令协议
protocol Command {
    var receiver:Receiver { get set }
    var isExcute:Bool { get set }
    
    func Execute()
}

/// 命令基类
class ConcreteCommand: Command {
    var receiver: Receiver
    var isExcute: Bool = false
    init(receiver: Receiver) { self.receiver = receiver }
    func Execute() {
        if !isExcute {
            self.receiver.Action()
        }
    }
}

/// 要求该命令执行这个请求
class Invoker {
    private var command = [Command]()
    func addCommand(cmd: Command) {
        self.command.append(cmd)
    }
    func ExecuteCommand() {
        self.command.forEach{ $0.Execute() }
    }
}

func mainExcute() {
    let r = Receiver()
    let c = ConcreteCommand.init(receiver: r)
    let i = Invoker()
    i.addCommand(c)
    c.isExcute = false
    i.ExecuteCommand()
    
    c.isExcute = true
    i.ExecuteCommand()
}

