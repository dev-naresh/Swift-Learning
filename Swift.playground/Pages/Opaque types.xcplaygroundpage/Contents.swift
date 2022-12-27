//: [Previous](@previous)

import Foundation


protocol CardTypeProto {
    
}

extension String: CardTypeProto {
    
}

protocol Card: Equatable {
    associatedtype CardNumber: CardTypeProto
    
    var cardNo: String { get set }
    var cardType: String { get set }
    var cardLimit: Int { get set }
    
    func cardEligiblity() -> Int
}

struct VisaCard: Card {
    typealias CardNumber = String
    
    var cardNo: CardNumber = "0000 0000 0000 0000"
    var cardType: String = "Platinum"
    var cardLimit: Int = 30000
    
    func cardEligiblity() -> Int {
        return cardLimit
    }
}

struct MasterCard : Card {
    typealias CardNumber = String
    
    var cardNo: CardNumber = "2003 0000 0000 0000"
    var cardType: String = "Platinum"
    var cardLimit: Int = 40000
    
    func cardEligiblity() -> Int {
        return cardLimit
    }
}

//var master = MasterCard()
//var visa = VisaCard()

func cardInfoLoan() -> some Card {
        return MasterCard()
}

func cardInfoLimit() -> some Card {
    
    return VisaCard()
}

func card<T: Card>(_ a: T, _ b: T) {
    print(a==b)
}
card(cardInfoLoan(),cardInfoLoan())
print(cardInfoLimit() == cardInfoLimit())
func LoanAnalysis() {
    if(cardInfoLoan().cardLimit <= cardInfoLimit().cardLimit) {
        print("Loan Available")
    }
    else {
        print(cardInfoLoan(),cardInfoLimit())
        print("Loan Not Available")
    }
}

LoanAnalysis()


protocol m {
    associatedtype T
    var le : Int {get}
    var hh : T {get }
}
protocol n : m {
    associatedtype wer : n  where wer.T == T
}
struct bn<T> : m {
    var hh: T
    var le: Int = 0
}

var bnn: some m = bn(hh: "yenkay")

func returnObj (_ a : Int) -> any m {
    bn(hh: a)
}

print(returnObj(3))

func temp<T: Card> (_ card : T) {
    print(type(of: card))
    print(card)
}

func temp1(_ card : some Card) {
    print(type(of: card))
    print(card)
}

func temp2(_ card : any Card) {
    print(type(of: card))
    print(card)
}

temp(MasterCard())
temp1(MasterCard())
temp2(MasterCard())

internal class A {
    fileprivate var a : Int = 0
}

print(A().a)

//var cm : [some Card] = [MasterCard() , VisaCard()]
//: [Next](@next)


var mb : Int = 0 {
    willSet {
        print(mb)
    }
}

mb = 10


func temp () -> Int {
    var step = 4
    return step
}


//func stepCount (_ num : inout Int) {
//
//    num += temp()
//}
//
//stepCount()

var tempvar = 10
var clo: (Int) -> Void = { s1 in
    var s2 = s1
    s2 += tempvar
    print(s1)
}



func cloCheck (_ clo: /*@escaping*/ (Int) -> Void, _ temp: inout Int) {
    clo(temp)
//    escClo = clo
}

cloCheck(clo, &tempvar)



