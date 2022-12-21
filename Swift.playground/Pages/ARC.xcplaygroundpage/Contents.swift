//: [Previous](@previous)

import Foundation

class Bus {
    var name: String
    var passenger: Passenger?
    
    init(_ name: String) {
        self.name = name
    }
    
    deinit {
        print("Bus has been deallocated")
    }
}

class Passenger {
    var name: String
    unowned var bus: Bus
    
    init(_ name: String) {
        self.name = name
    }
    
    deinit {
        print("Passenger has been deallocated")
    }
}

var m27: Bus? = Bus("m27")
var tick: Passenger = Passenger("asdf")
//var xyz: Passenger? = Passenger("xyz")

m27!.passenger = nil
tick.bus = nil
//xyz!.bus = m27
//
//m27 = nil
//xyz = nil



//: [Next](@next)
