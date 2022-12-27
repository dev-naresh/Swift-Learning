//: [Previous](@previous)

import Foundation

var queue = DispatchQueue(label: "a", attributes: .concurrent)

queue.async{
    print("sync Test",Thread.current)
    queue.sync{
        print("Async Test",Thread.current)
    }
    print()
    queue.async{
        print(Thread.current)
        Thread.sleep(forTimeInterval: 3)
        print("Test")
    }
}
queue.sync {
    print("Deadlock",Thread.isMainThread)
}
    print()

//Task{
//    print("\n",Thread.current,"\n")
//    DispatchQueue.main.async {
//        for i in 0...2 {
//            print(i,Thread.current,"🫥")
//            Thread.sleep(forTimeInterval: 0.5)
//        }
//    }
//
//    DispatchQueue.global().sync {
//        for i in 0...2 {
//            print(i,Thread.current)
//            Thread.sleep(forTimeInterval: 0.5)
//        }
//    }
//
//    DispatchQueue.global(qos: .background).async {
//        for i in 0...2 {
//            print(i,Thread.current)
//            Thread.sleep(forTimeInterval: 0.5)
//        }
//    }
//
//    DispatchQueue.main.sync {
//        for i in 0...2 {
//            print(i,Thread.current)
//            Thread.sleep(forTimeInterval: 0.5)
//        }
//    }
//
//    DispatchQueue.main.sync {
//        for i in 0...2 {
//            print(i,Thread.current)
//            Thread.sleep(forTimeInterval: 0.5)
//        }
//    }
//
//    DispatchQueue.global(qos: .background).async {
//        for i in 0...2 {
//            print(i,Thread.current)
//            Thread.sleep(forTimeInterval: 0.5)
//        }
//    }
//}


let AQueue = DispatchQueue(label: "a", attributes: .concurrent)

AQueue.sync {
    for i in 1...5 {
        print(i,Thread.isMainThread)
    }
}

AQueue.async {
    for i in 6...10 {
        print(i)
    }
}

AQueue.async {
    for i in 6...10 {
        print(i,Thread.current)
    }
}

AQueue.sync {
    for i in 11...15 {
        print(i,Thread.isMainThread)
    }
}

AQueue.sync {
    for i in 16...20 {
        print(i,Thread.isMainThread)
    }
}

AQueue.async {
    for i in 21...25 {
        print(i,Thread.current)
    }
}
//: [Next](@next)
