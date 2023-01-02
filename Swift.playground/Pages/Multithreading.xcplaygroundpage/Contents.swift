////: [Previous](@previous)
//
import Foundation
//
//var queue = DispatchQueue(label: "a", attributes: .concurrent)
//
//queue.async{
//    print("sync Test",Thread.current)
//    queue.sync{
//        print("Async Test",Thread.current)
//    }
//    print()
//    queue.async{
//        print(Thread.current)
//        Thread.sleep(forTimeInterval: 3)
//        print("Test")
//    }
//}
//queue.sync {
//    print("Deadlock",Thread.isMainThread)
//}
//    print()
//
////Task{
////    print("\n",Thread.current,"\n")
////    DispatchQueue.main.async {
////        for i in 0...2 {
////            print(i,Thread.current,"🫥")
////            Thread.sleep(forTimeInterval: 0.5)
////        }
////    }
////
////    DispatchQueue.global().sync {
////        for i in 0...2 {
////            print(i,Thread.current)
////            Thread.sleep(forTimeInterval: 0.5)
////        }
////    }
////
////    DispatchQueue.global(qos: .background).async {
////        for i in 0...2 {
////            print(i,Thread.current)
////            Thread.sleep(forTimeInterval: 0.5)
////        }
////    }
////
////    DispatchQueue.main.sync {
////        for i in 0...2 {
////            print(i,Thread.current)
////            Thread.sleep(forTimeInterval: 0.5)
////        }
////    }
////
////    DispatchQueue.main.sync {
////        for i in 0...2 {
////            print(i,Thread.current)
////            Thread.sleep(forTimeInterval: 0.5)
////        }
////    }
////
////    DispatchQueue.global(qos: .background).async {
////        for i in 0...2 {
////            print(i,Thread.current)
////            Thread.sleep(forTimeInterval: 0.5)
////        }
////    }
////}
//
//
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
//
//AQueue.sync {
//    for i in 16...20 {
//        print(i,Thread.isMainThread)
//    }
//}
//
//AQueue.async {
//    for i in 21...25 {
//        print(i,Thread.current)
//    }
//}

//Dispatch group
let homeQueue = DispatchQueue(label: "a")

let dispatchGroup = DispatchGroup()


func homeScreenLoader() {
    dispatchGroup.enter()
    
    DispatchQueue.global().async {
//        print("Enter the username: ")
        var name: String? = "naresh"
//        print("Enter the password: ")
        var password: String? = "2342w41q"
        dispatchGroup.leave()
    }
    var waitResult = dispatchGroup.wait(timeout: .now() + .seconds(4))
    dispatchGroup.notify(queue: .global()) {
        print("Credentials entered...", waitResult)
    }
}

//homeScreenLoader()


//Dispatch work item

let workItem = DispatchWorkItem {
    sleep(3)
    DispatchQueue.main.async {
        print("Work item test")
    }
    print("Work item executed")
}

DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1), execute: workItem)
workItem.cancel()
if workItem.isCancelled {
    print("The work item has been cancelled")
}

// Barrier and semaphores

var semaphore: DispatchSemaphore = DispatchSemaphore(value: 2)

var total = 80
var proA = [30, 20, 10]
//var proB = 20

func sub(_ input: Int) {
    semaphore.wait()
    if total >= input {
        total -= input
        print("Total: ", total)
        semaphore.signal()
    }
    else {
        print("Greater value...")
//        semaphore.signal()
    }
}

for i in proA {
//    AQueue.async(flags: .barrier) {
//        sub(i)
//    }
    AQueue.async {
        sub(i)
    }
}

var q1 = DispatchQueue(label:"a",attributes: .concurrent)
var q2 = DispatchQueue(label: "b",target: q1)

q2.async {
    for i in 0...5{
        Thread.sleep(forTimeInterval: 1)
        print(Thread.current)
    }
}
q2.async {
    for i in 0...5{
        Thread.sleep(forTimeInterval: 1)
        print(Thread.current)
    }
}

q1.sync {
    for i in 0...5{
        Thread.sleep(forTimeInterval: 1)
        print(i, Thread.current)
    }
}
q1.async {
    for i in 0...5{
        Thread.sleep(forTimeInterval: 1)
        print(Thread.current)
    }
}

//: [Next](@next)
