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

//print(convertedNumber ?? 0)

let int1: UInt32 = 2_00
let int2: UInt8 = 22

let inttotal = int1 + UInt32(int2)

print(inttotal)

//Optionals
var a1: Optional<Int>

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

var al: [Any] = [4,"lajfldsa"]
print(al)

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



func nameGuard(a:Int=3,b:Int){
    let nameguard: String? = nil
    guard let unwrappedName = nameguard else {
        print("Ending..")
        return
    }
    print(unwrappedName.count)
}

nameGuard(b:2)

var customersInLine = ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> Int) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.count)


enum Planet: Character {
    case mercury = "a"//, venus, earth="c", mars, jupiter, saturn, uranus, neptune
}

var planet = Planet.mercury

print(planet)


//class Caller {
//    var call:(()->Void )?
//
//
////    func Caller(call1:()->Void){
////        self.call! = call1
////    }
//}
//
//var cal = Caller()
//cal.call! = {
//    print("hello")
//}
//
//var dd = cal.call!
//
//dd()


func calculate(a: Int, b: Int? )-> Int {
    return sub(a,b ?? 0)
//    return a+b
}

func sub(_ a : Int, _ b: Int)-> Int {
    return a-b
}

print(calculate(a:4,b:nil))
print("")

for a in 1...10{
    print(a)
}

//Class reference inside a array
class Student {
    var roll: Int
    var name: String
    
    init(_ roll: Int, _ name: String){
        self.roll = roll
        self.name = name
    }
}

//var student = Student(1, "naveen")

var studentList : [Student] = []

studentList.append(Student(1, "naveen"))

print("\n\(studentList[0])")
print(studentList[0].roll)
print(studentList[0].name)


//Structure object inside a set using hashable protocol
struct Employee: Hashable {
    var empId: Int
    var name: String
    
    init(_ empId: Int, _ name: String){
        self.empId = empId
        self.name = name
    }
}

var empList : Set<Employee> = Set()

empList.insert(Employee(1, "naresh"))

for emp in empList {
    if emp.empId == 1 {
        print(emp)
    }
}

print("")

//Enumeration example using the switch and fallthrough
enum Name  {
    case one
    case two
    case three
    case four
}

var names = Name.two

switch names {
    case .one:
        print("One")
    case .two:
        print("Two")
        fallthrough
    case .three:
        print("Three")
    case .four:
        print("Four")
}

print("")

var namesClo: [String] = ["Naveen", "Naresh", "Shobana", "Dhanu"]

var reversedNames = namesClo.sorted(by: { s1, s2 in s1 < s2 })

print(reversedNames)

struct A: Equatable {
    var i : Int
    init(a : Int){
        i = a
    }
}

var aa = A(a:8)
var b = A(a:8)

print(aa == b)


struct AB {
    var a : Int
    
}
var text: String?
print(text ?? "xyz")


class AAA {
    static var num1 = 100
}

print(AAA.num1)




class Person {
    var residence: Residence? = Residence()
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

//let roomCount = john.residence!.numberOfRooms

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}




class Apple {
    var features: Features?
    
    init(){
//        features = Features(1)
    }
}

class Features {
    var data : Int = sdf()
    
    init?() {
     //   self.data = sdf()
        //data = self.setter
    }
    
    static func sdf() -> Int {
        return 9
    }
    
    deinit {
        print("Deinit")
    }
}


//var feat :Features =
class tempo {
    var feat = Features()
    
//    guard let a = feat?.data else {
//        print("dsjfla")
//    }
}

print(tempo())
//var feat1 = feat


//feat.data = 5

//print(feat?.data ?? 0 )

//if(feat.data === feat1.data) {
//    print("Success")
//}
//else {
//    print("Fail")
//}

//
//if let a = feat?.data {
//    print(a)
//}
//
//print(feat?.data)



var apple : Apple = Apple()


var ay : Int?




class Task {
    var name : String
    var task : String
    var priority : Character
    
    init(  _ name : String, _ task : String, _ priority : Character){
        self.name = name
        self.task = task
        self.priority = priority
        print(name)
    }
    
    func getTask() {
        print(name)
    }
}

class MainTask : Task{
    var num : Int
    override init(_ name : String, _ task : String, _ priority : Character){
     
        num = 1
        super.init(name, task, priority)
        
    }
    
    var task1 = MainTask("nad", "azgfsz", "I")
}

class SubTask :Task{
}



func multi() {
    
}


//var int = Int()

class Ah {
    var n : Int = 0
    
    
}

class Bh {

    var obj = Ah()
//    func printd(){
//        print(obj.n)
//    }
}



