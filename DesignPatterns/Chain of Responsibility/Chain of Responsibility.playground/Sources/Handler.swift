//
//  Handler.swift
//  DesignPatterns
//
//  Created by zmj27404 on 16/6/20.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//

import Foundation
//  职责链模式(Chain of Responsibility):使多个对象都有机会处理请求，从而避免请求的发送者和接收者之间的耦合关系。将这个对象连成一个链，并沿着这条链传递该请求，直到有一个对象处理它为止
//  职责链的好处
//  当客户提交一个请求时，请求是沿链传递直至有一个ConcreteHandler对象负责处理它。
//  接收者和发送者都没有对方的明确信息，且链中的对象自己也并不知道链的结构。结果是职责链可简化对象的相互连接。它们仅需保持一个指向其后继者的引用，而不需保持它所有的候选接受者的引用。随时地增加或修改处理一个请求的结构。增强了给对象指派职责的灵活性;一个请求极有可能到了链的末端都得不到处理，或者因为没有正确配置而得不到处理。
//

public protocol HandlerProtocol {
    var successor:HandlerProtocol? { get set }
    func HandleRequest(request: Int)
}

public class Handler: HandlerProtocol {
    public var successor: HandlerProtocol? = nil
    public func HandleRequest(request: Int) { }
    public init(handler: HandlerProtocol?) {
        self.successor = handler
    }
    public init() {}
}

public class ConcreteHandler1: Handler {
    override public func HandleRequest(request: Int) {
        if (request >= 0 && request < 10) {
            print("\(self.dynamicType) 处理请求 \(request)")
        }
        else {
            if  let suc = self.successor {
                suc.HandleRequest(request)
            }
        }
    }
}

public class ConcreteHandler2: Handler {
    override public func HandleRequest(request: Int) {
        if (request >= 10 && request < 20) {
            print("\(self.dynamicType) 处理请求 \(request)")
        }
        else {
            if  let successor = self.successor {
                successor.HandleRequest(request)
            }
        }
    }
}

public class ConcreteHandler3: Handler {
    override public func HandleRequest(request: Int) {
        if (request >= 20 && request < 30) {
            print("\(self.dynamicType) 处理请求 \(request)")
        }
        else {
            self.successor?.HandleRequest(request)
        }
    }
}