//: [Previous](@previous)

import Foundation

//Closure

var clofunc : (() -> Void) = {
    print("Closure")
}

clofunc()


func norFunc(  _ closure : () -> Void){
    closure()
}

norFunc(clofunc)


//Autoclosure

struct Employee {
    var empId : Int
    var empType : String
    
//    init(_ empId : Int, _ empType : String){
//        self.empId = empId
//        self.empType = empType
//    }
}

var emp1 = Employee(empId : 3,empType: "Dev")

func access(_ accessclo : @autoclosure () -> String){
    if accessclo() == "Dev" {
        print("Access allowed")
        return
    }
    print("Invalid access")
}

access(emp1.empType)


//Escaping Closure

var tempEsc : (() -> Void) = {}
 
func escFunc(_ escFunc : @escaping () -> Void){
    tempEsc = escFunc
    print("escFunc is invoked")
}


escFunc(clofunc)
tempEsc()

//Trailing closure

func trailFunc(clo: () -> Int, clo2: () -> Int){
    print(clo())
    print(clo2())
}

trailFunc(){
    return 9
}clo2: {
    return 10
}

enum direct {
    case north
    case south
}

//for d in direct.allCases {
//    print(d)
//}


func temp(_ a : Int) {
    
}

temp(7)
//: [Next](@next)
