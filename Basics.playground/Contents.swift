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
//var student = ("asdfg", 21,21,32,74)
var student = (name: "asdfg", m1: 21, m2: 21, m3: 32, 74)

//var (name,m1,m2,m3, _) = student

print("\(student)\n")
print("Name: \(student.name)")
print("Subject1: \(student.m1)")
print("Subject2: \(student.m2)")
print("Subject3: \(student.m3)")
print("Total: \(student.4)\n")

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

print(convertedNumber! + 1)
