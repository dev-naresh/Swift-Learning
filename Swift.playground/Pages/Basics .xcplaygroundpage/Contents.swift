import Cocoa


// Types of declarations
let a : Int  //type anotation with constant variable
var b = "XYZ" //type interface

var x, y, z : Int //Multiple variable of same type in same line


// Type aliases
typealias rollNo = UInt64

var roll = rollNo.max
print(roll)

print("\n")



//Optionals
var opt : String?
var opt1 = Int("234")


//Unwrapping
//1. If statement
if opt1 != nil {
    print("Success")
}
//2. Force unwrap
print(opt1!)

//3.Optional binding
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

var i = 1
while let num = Int("5"), i <= num {
    print(i)
    i += 1
}

//Implicitly unwrapped
var impOpt : String! = "Naresh"
var unOpt : String = impOpt

print(impOpt ?? 0)
print(unOpt)

//Assertion

//if rollNo.max > 1 {
//    assertionFailure("Signed integer")
//}

//assert(unOpt != "Naresh", "The given expression is false")
//precondition(unOpt != "Naresh", "The given expression is false")



class TestA {
    var teststr: String = "asdcv"
    var test: String {
        return "Testing....A"
    }
}

class TestB: TestA {
//    override var teststr: String = "afdsfa"
    override var test: String {
        return "Testing....B"
    }
}




