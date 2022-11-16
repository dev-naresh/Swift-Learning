//: [Previous](@previous)

import Foundation

//Error handling

enum studentError : String, Error {
    case rollNoErr = "This input doesn't have a roll number", mobNoErr = "This input doesn't have a mobile number", stuNameErr = "This input doesn't have a student name"
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
    print(studentError.rollNoErr.rawValue)
}
catch studentError.stuNameErr{
    print(studentError.stuNameErr.rawValue)
}
catch studentError.mobNoErr{
    print(studentError.mobNoErr.rawValue)
}


var x = try? stu1.studentCheck()

//stu1.studentCheck()

print(x ?? 0)




//: [Next](@next)
