//
//  Mediator.swift
//  DesignPatterns
//
//  Created by zmj27404 on 16/6/20.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//
//  中介者模式(Mediator),用一个中介对象来封装一系列的对象交互。中介者使个对象不需要显示地相互引用，从而使其耦合松散，而且可以独立地改变它们之间的交互
//  中介者模式很容易在系统中应用，也很容易在系统中误用。当系统出现了"多对多"交互复杂的对象群时，不要急于使用中介者模式，而要先反思你的系统在设计上是不是合理。
//  Mediator的出现减少了各个Colleague的耦合，使得可以独立的改变和复用各个Colleague类和Mediator，由于把对象如何协作进行了抽象，将中介作为一个独立的概念并
//  将其封装在一个对象中，这样关注的对象就从对象各自本身的行为转移到它们之间的交互上来，也就是站在一个更宏观的角度来看待系统。
//  由于ConcreteMediator控制了集中化，于是就把交互复杂性变为了中介者的复杂性，这就使得中介者会变得比任何一个ConcreteColleague都复杂。
//  中介者模式一般应用于一组对象以定义良好但是复杂的方法进行通信的场合。以及想定制一个分布在多个类中的行为，而又不想生成太多的子类的场合。

import Foundation

/**
 *  @author zmj, 16-06-20 22:06:22
 *
 *  Mediator抽象中介者协议
 */
public protocol Mediator {
    func send(message: String, colleague: Colleague)
}

/// 抽象同事类
public class Colleague: Equatable {
    public var mediator: Mediator?
    public var name: String
    public init(mediator: Mediator?, name: String) {
        self.mediator = mediator
        self.name = name
    }
    public func send(message: String){
        self.mediator?.send(message, colleague: self)
        print("\(self.name) 发送的消息:\(message)")
    }
    public func notify(message: String) {
        print("\(self.name) 得到的消息:\(message)")
    }
}

public func ==(col1: Colleague, col2: Colleague) -> Bool {
    if col1.name == col2.name {
        return true
    }
    return false
}

/// 具体同事类
public class ConcreteColleague1: Colleague {
}

public class ConcreteColleague2: Colleague {
    
}

public class ConcreteMediator: Mediator {
    private unowned var colleague1: ConcreteColleague1
    private unowned var colleague2: ConcreteColleague2
    public init(col1: ConcreteColleague1, col2: ConcreteColleague2) {
        self.colleague1 = col1
        self.colleague2 = col2
    }
    
    public func send(message: String, colleague: Colleague) {
        if colleague == self.colleague1 {
            self.colleague2.notify(message)
        }
        else {
            self.colleague1.notify(message)
        }
    }
}




