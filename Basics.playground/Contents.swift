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
var student = ("asdfg", 21,21,32)

var (name,m1,m2,m3) = student

print("\(student)\n")
print("Name: \(name)")
print("Subject1: \(m1)")
print("Subject2: \(m2)")
print("Subject3: \(m3)\n")
