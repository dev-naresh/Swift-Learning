//: [Previous](@previous)

import Foundation

class Test1Operation: Operation {
    override func main() {
        if isCancelled {
            return
        }
        print("TestOperation1",Thread.isMainThread)
//        sleep(2)
        for i in 1...3{
            print(i)
        }
    }
}

class Test2Operation: Operation {
    override func main() {
        print("TestOperation2",Thread.isMainThread)
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(1)) {
            print("Executed")
        }
        for i in 11...13{
            print(i)
        }
    }
}

var test: Test2Operation = Test2Operation()
test.main()

let opQueue: OperationQueue = OperationQueue()

var test1 = Test1Operation()

var operation = BlockOperation{
    print("BLOCKOPERATION...")
}
//DispatchQueue.main.async {
//    operation.start()
//    print(Thread.isMainThread)
//}
////test1.cancel()
//test1.start()
//sleep(2)
//
var test2 = Test2Operation()
//test2.start()
//sleep(2)
//
//test1.cancel()
//test2.cancel()
test2.addDependency(test1)
opQueue.addOperations([test1, test2], waitUntilFinished: false)
//opQueue.addOperation {
//    DispatchQueue.main.async {
//        print("Async1 dispatch")
//        test1.start()
//    }
//
//}
//opQueue.addOperation {
//    DispatchQueue.main.async {
//        print("Async2 dispatch")
//        test2.start()
//    }
//}

opQueue.maxConcurrentOperationCount = 1

class AsyncOperation : Operation {
  enum State{
    case Waiting, Executing, Finished
  }
  
  
  var state = State.Waiting{
    willSet{
      switch(state, newValue){
      case (.Waiting, .Executing):
        willChangeValue(forKey: "isExecuting")
      case (.Waiting, .Finished):
        willChangeValue(forKey: "isFinished")
      case (.Executing, .Finished):
          willChangeValue(forKey: "isExecuting")
          willChangeValue(forKey: "isFinished")
      default:
        fatalError("Invalid state change in AsyncOperation: \(state) to \(newValue)")
      }
    }
    didSet{
      switch(oldValue, state){
      case (.Waiting, .Executing):
          didChangeValue(forKey: "isExecuting")
      case (.Waiting, .Finished):
          didChangeValue(forKey: "isFinished")
      case (.Executing, .Finished):
          didChangeValue(forKey: "isExecuting")
          didChangeValue(forKey: "isFinished")
      default:
        fatalError("Invalid state change in AsyncOperation: \(oldValue) to \(state)")
      }
    }
  }
  
  override var isExecuting: Bool {
    return state == .Executing
  }
  
  override var isFinished: Bool {
    return state == .Finished
  }
  
  override var isAsynchronous: Bool {
    return true
  }
  
  
  override init() {
    super.init()
    addObserver(self, forKeyPath: "isCancelled", options: [], context: nil)
  }
  
  
  deinit {
    removeObserver(self, forKeyPath:"isCancelled")
  }
//
//
//
//
//
//  override func start() {
//      guard Thread.isMainThread else{
//      fatalError("AsyncOperation should only run on the main thread.")
//    }
//
//    guard !hasCancelledDependencies else{
//      cancel()
//      return
//    }
//
//      guard !isCancelled else{
//      return
//    }
//
//    state = .Executing
//    main()
//  }
//
//  override func main() {
//    finish()
//  }
//
//  func didCancel(){
//    finish()
//  }
//
//  func finish(){
//    state = .Finished
//  }
//}
//
//
//
////private extension AsyncOperation{
////  var hasCancelledDependencies:Bool{
////      return dependencies.reduce(false){ $0 || $1.isCancelled }
////  }
}


//: [Next](@next)
