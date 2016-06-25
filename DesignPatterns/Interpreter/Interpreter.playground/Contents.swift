//: Playground - noun: a place where people can play

import Cocoa

func main() {
    let c = Context(input: "hello")
    NonterminalExpression.interpret(c)
    TerminalExpression.interpret(c)
}

main()
