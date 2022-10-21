import Cocoa

var greeting = "Hello, playground\n"
//let greeting = "Hello, playground"

//type annotation
var a:Int = 10

//String interpolation
greeting = "The number is \(a)"

//print(Int8.max)
print("\(greeting)\n")

//Tuples
//var student = ("asdfg", 21,21,32,74) //We can access the values without the tuple name.
//var (name,m1,m2,m3, _) = student
var student: [(name:String,m1:Int,m2:Int,m3:Int)] = [("asdfg", 21, 21, 32),("asfg", 1, 1, 3)]

print("\(student[1])\n")
//print("Name: \(student.name)")
//print("Subject1: \(student.m1)")
//print("Subject2: \(student.m2)")
//print("Subject3: \(student.m3)")
//print("Total: \(student.4)\n")

let possibleNumber = "123"
let convertedNumber: Int? = nil
//let convertedNumber = Int(possibleNumber)

//print(convertedNumber? ?? 0)

let int1: UInt32 = 2_00
let int2: UInt8 = 22

let inttotal = int1 + UInt32(int2)

print(inttotal)

//Optionals

if convertedNumber != nil {
    print("\nconvertedNumber has an integer value of \(convertedNumber!).")
}

let nameOptional: String! = "qwer"
var nbvc : String = nameOptional
print(nbvc)

if let unwrappedName = nameOptional {
    print(unwrappedName)
}

let name: String? = nil
print(name?.count ?? 0)

if let actualNumber = Int8(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}

let myNumber = Int(possibleNumber)
// Here, myNumber is an optional integer
if let myNumber = myNumber {
    // Here, myNumber is a non-optional integer
    print("My number is \(myNumber)")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber , secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

for name1 in -5..<2 {
    print(name1)
}

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: \#n"""
"""#
print(threeMoreDoubleQuotationMarks)


let greeting1 = "Guten Tag!"

print(greeting1.firstIndex(of: "e")!)

var a1: [Any] = [4,"lajfldsa"]
print(a1)

var x:[Int] = [1,2,3,4,5]

x[3...4] = [2,3]

print(x)

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
case 21:
    description += " a prime number, and also"
default:
    description += " an integer."
}
print(description)

//let nameguard: String? = nil
//guard let unwrappedName = nameguard else {
//    print("Ending..")
//}
//print(unwrappedName.count)
