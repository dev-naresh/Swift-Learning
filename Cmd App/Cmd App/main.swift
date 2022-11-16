//
//  main.swift
//  Cmd App
//
//  Created by naresh-pt6259 on 16/11/22.
//

import Foundation

//import

//print("Enter a name: ", terminator: "")
//
//var name : String = ""
//
//if let inputName = readLine() {
//    name = inputName
//}
//print(name)

protocol Crud {
    mutating func addStudent(rollNo: Int, name: String, phnNo: String)
    mutating func getStudent(rollNo: Int)
    mutating func updateStudent(rollNo: Int, name: String, phnNo: String)
    mutating func deleteStudent(rollNo: Int)
}

struct StudentApi: Crud {
//    var student = Student(rollNo: 1, name: "Naresh", phnNo: "345674567")
    var students : Set<Student> = []
    
    mutating func addStudent(rollNo: Int, name: String, phnNo: String) {
        students.insert(Student(rollNo: rollNo, name: name, phnNo: phnNo))
        for student in students {
            if student.rollNo == 3 {
                print(student.rollNo,student.name,student.phnNo)
            }
        }
        print(students.contains(Student(rollNo: 3, name: "adsff", phnNo: "32424342")))
    }
    
    mutating func getStudent(rollNo: Int) {
        for student in students {
            if student.rollNo == 3 {
                print(student.rollNo,student.name,student.phnNo)
            }
        }
    }
    
    mutating func updateStudent(rollNo: Int, name: String, phnNo: String) {
        students.insert(Student(rollNo: rollNo, name: name, phnNo: phnNo))
        for student in students {
            if student.rollNo == 3 {
                print(student.rollNo,student.name,student.phnNo)
            }
        }
    }
    
    mutating func deleteStudent(rollNo: Int) {
        print(students.contains(Student(rollNo: 3, name: "adsff", phnNo: "32424342")))
        for student in students {
            if student.rollNo == 3 {
                print(student)
                students.remove(student)
            }
        }
        print(students.contains(Student(rollNo: 3, name: "adsff", phnNo: "32424342")))
    }
}


var main = StudentApi()

mainWhile : while true {
    print("\nWelcome!!! \n1.Add student\n2.Update student\n3.Delete student\n4.Exit")
    print("Enter a choice: ", terminator: "")
    
    var choice: Int?
    if let choiceIf = readLine() {
        choice = Int(choiceIf)
    }
    switch choice {
    case 1: main.addStudent(rollNo: 3, name: "adsff", phnNo: "32424342")
    case 2: main.updateStudent(rollNo: 3, name: "adsff", phnNo: "32424342")
    case 3: main.deleteStudent(rollNo: 3)
    case 4: break mainWhile
    default: print("Wrong choice\n")
    }
}
