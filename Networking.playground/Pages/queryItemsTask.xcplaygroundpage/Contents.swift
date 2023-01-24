//: [Previous](@previous)

import Foundation

func queryItem(_ queryDict: [String: Any]) {
    var session = URLSession(configuration: .default)
    
//http://demo8925853.mockable.io/
    
    var component = URLComponents()
    component.scheme = "http"
    component.host = "demo8925853.mockable.io"

//    component.queryItems = [URLQueryItem(name: "id", value: "bcbc9703-b974-463d-abf4-bb12d1710bf4")]
    component.queryItems = queryDict.map{ URLQueryItem(name: $0, value: $1 as! String) }
    print(component.url)
    session.dataTask(with: component.url!){
        data, response, error in
        
//        print(response)
        print(try! JSONSerialization.jsonObject(with: data!, options: []))
    }.resume()
}

queryItem(["id": "bcbc9703-b974-463d-abf4-bb12d1710bf4", "createdBy": "19658421"])

//queryItem()


//: [Next](@next)
