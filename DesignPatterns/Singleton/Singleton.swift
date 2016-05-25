//
//  Singleton.swift
//  DesignPatterns
//
//  Created by zmj27404 on 16/5/25.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//

import Foundation

class Singleton {
    func sharedSingleton() -> Singleton {
        struct singletonObject {
            static let shared = Singleton();
        }
        return singletonObject.shared
    }
    
    //“全局变量（静态成员变量和结构体以及枚举）的延迟构造器在其被第一次访问时会加载，并以dispatch_once的方式启动来确保初始化的原子性。这让你写代码时可以用一种很酷的方式来使用dispatch_once：直接用一个全局变量的构造器去做初始化并用private来修饰。“ — Apple’s Swift Blog
    //用全局变量即可获取单例对象
    static let sharedSingletonObject = Singleton()
    private init() {
        
    }
    
    func print() -> String {
        return "Singleton,\(self)"
    }
}

class testOne {
    var name = "c"
    init(name: String) {
        self.name = name
    }
    func test01() {
        let single = Singleton.sharedSingletonObject
        single.print()
    }
    func test02() {
        let single = Singleton.sharedSingletonObject
        single.print()
    }
}