//: [Previous](@previous)

import Foundation

@propertyWrapper
struct Props {
    private var a : Int
//    private(set) var projectedValue :
    
    var wrappedValue : Int {
        get {
            return a
        }
        set {
            if(newValue > 0){
                a = newValue
            }
        }
    }
     
    init() {
        self.a = 0
    }
    
    init(_ a : Int) {
        self.a = a
    }
}

struct Props2 {
    @Props var a : Int
}

var prop2 = Props2()

prop2.a = -9

print(prop2.a)



struct Subscript {
    var arr : [Int] = [1]
    var a : Int = 0

    subscript(_ x : [Int])  -> [Int] {
        get {
            print("naveen")
            return arr
        }
        set{
            self.arr = newValue
        }
    }
    
    subscript(_ a : Int) -> Int {
        return self.a
    }
    
    var b : Int {
        get {
            return a
        }
        set {
            self.a = newValue
        }
    }
}

var num = Subscript()

num.arr
print("This is \(num[0])")
num.b = 9
print(num[8])

var a = [1 : "One"]

a[1]

print(num.b)

//print(num[])
num[num.arr] = [7,6]
print(num[num.arr])



//Error handling

enum studentError : Error {
    case rollNoErr, mobNoErr, stuNameErr
}

struct student {
    var rollNo : Int
    var stuName : String
    var mobNo : Int
    
    func studentCheck() throws -> Int {
        guard rollNo > 0 else {
            throw studentError.rollNoErr
        }
        guard stuName != "" else {
            throw studentError.stuNameErr
        }
        guard mobNo != 0 else {
            throw studentError.mobNoErr
        }
        return 0
    }
}

var stu1 = student(rollNo: 9, stuName: "afsdlj", mobNo: 0)

do {
    try stu1.studentCheck()
}
catch studentError.rollNoErr{
    print(studentError.rollNoErr)
}
catch studentError.stuNameErr{
    print(studentError.stuNameErr)
}
catch studentError.mobNoErr{
    print(studentError.mobNoErr)
}


var x = try? stu1.studentCheck()

print(x ?? 0)

//: [Next](@next)
