//: Playground - noun: a place where people can play

import Cocoa

func mainFuc() {
    let c1 = ConcreteColleague1(mediator: nil, name: "美国")
    let c2 = ConcreteColleague2(mediator: nil, name: "中国")
    let m = ConcreteMediator(col1: c1, col2: c2)
    c1.mediator = m
    c2.mediator = m
    c1.send("小子，别嚣张，有你好看的")
    c2.send("哈哈，我等着瞧，哈哈!!")
}

mainFuc()


