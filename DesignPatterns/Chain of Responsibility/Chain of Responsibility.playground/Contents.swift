//: Playground - noun: a place where people can play

import Cocoa

func mainFunction() {
    let h1 = ConcreteHandler1()
    let h2 = ConcreteHandler2()
    let h3 = ConcreteHandler3()
    h1.successor = h2
    h2.successor = h3
    [2, 5, 14, 18, 20, 22, 38, 20, 4, 8, 2, 14, 28].forEach{ h1.HandleRequest($0) }
}

mainFunction()



