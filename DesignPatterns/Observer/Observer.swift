//
//  Observer.swift
//  DesignPatterns
//
//  Created by zmj27404 on 16/6/2.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//
//  将一个系统分割成一系列相互协作的类有一个很不好的副作用，那就是需要维护相关对象间的一致性。我们不希望为了维持一致性而使各类紧密耦合，这样会给维护，扩展和重用都带来不便
//  什么时候使用观察者模式
//  当一个对象的改变需要同时改变其他对象，而且它不知道具体有多少对象有待改变时，应该考虑使用观察者模式。
//  一个抽象模型有两个方面，其中一方面依赖于另一方面，这时用观察者模式可以将这两者封装在独立的对象中使它们各自独立地改变和复用
//  观察者模式所做的工作其实就是在解除耦合。让耦合的双方都依赖与抽象，而不是依赖于具体。从而使得各自的变化都不会影响另一边的变化

//  事件委托说明
//  委托就是一种引用方法的类型。一旦为委托分配了方法，委托将与该方法具有完全相同的行为。委托方法的使用可以像其他任何方法一样，具有参数和返回值。委托可以看作是对函数的抽象，是函数的'类',委托的实例将代表一个具体的函数。
//  一个委托可以搭载多个方法，所有方法被依次唤起。可以使得委托对象所搭载的方法并不需要属于同一个类。
//  委托对象所搭载的所有方法必须具有相同的原形和形式，也就是拥有相同的参数列表和返回值类型。

import Foundation

// MARK: - 调用removeObject是不能直接调用的。需要写个扩展
extension Array {
    mutating func removeObject<U: Equatable>(object: U) {
        var index: Int?
        for (idx, objectToCompare) in self.enumerate() {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if(index != nil) {
            self.removeAtIndex(index!)
        }
    }
}

//定义观察者类
class Observer:NSObject {
    func Update() {
        print("老板回来了，我要干嘛!")
    }
    override init() {}
}

//通知对象
class Subject {
    var observers = [Observer]()
    
    //增加观察者
    func addObserver(observer: Observer) {
        observers.append(observer)
    }
    
    //删除观察者
    func removeObserver(observer: Observer) {
        observers.removeObject(observer)
    }
    
    //通知
    func notify() {
        observers.forEach { a in
            a.Update()
        }
    }
}

//具体通知对象
class ConcreteSubject: Subject {
    var subjectState: String = ""
}

//具体观察对象
class ConcreteObserver: Observer {
    private var name: String = ""
    private var observerState: String = ""
    private var subject: ConcreteSubject?

    init(_ subject: ConcreteSubject, name: String) {
        self.name = name
        self.subject = subject
    }
    
    override func Update() {
        observerState = subject!.subjectState
        print("观察者\(name)的新状态是\(observerState)")
    }
}

func main() {
    let s = ConcreteSubject()
    
    s.addObserver(ConcreteObserver(s, name: "X"))
    s.addObserver(ConcreteObserver(s, name: "Y"))
    s.addObserver(ConcreteObserver(s, name: "Z"))
    
    s.subjectState = "ABC"
    s.notify()
}
