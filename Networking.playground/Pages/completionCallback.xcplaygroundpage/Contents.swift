//: [Previous](@previous)

import Foundation

struct Test: Codable {
//    var id: Int
//    var postId: Int
//    var email: String
//    var name: String
//    var body: String
    var msg: String
//    var base: String
    
    enum CodingKeys: String, CodingKey {
        case msg = "msgtxt"
//        case base = "baseURL"
    }
}

func postPosts() -> [Any?] {
    var responseData: [Any] = []
    
    guard let url = URL(string: "https://postman-echo.com/post") else {
        print("Invalid link...")
        return []
    }
    
    var req = URLRequest(url: url)
    req.httpMethod = "POST"
    req.setValue("Application/json", forHTTPHeaderField: "Content-Type")
    req.httpBody = try? JSONEncoder().encode(Test(msg: "Hello, I'm a Developer."))
//    req.httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: [])
//    req.httpBody = try? JSONEncoder().encode(parameter)
//    req.allHTTPHeaderFields = ["X-Api-Key":"PMAK-63c678bd54f0fb5b737ec3a9-dd53b9455cd2dda094df9bf13b04b64fa3"]
//    req.allHTTPHeaderFields = ["X-Master-Key":"$2b$10$tJwbePxDZPklOJ4xffLoxeWQ.JkRAYdaObwskSbyzKzRTYoSa8qHK"]
    
    var session = URLSession.shared.dataTask(with: req) {
        data, response, error in
//        let resResult = response as? HTTPURLResponse
        responseData.append(response!)

//        print(response)
        type(of: data)
        type(of: error)
//        print(HTTPURLResponse.localizedString(forStatusCode: resResult!.statusCode))
//        print("Status code:",resResult?.statusCode ?? 0)

        if let error = error {
//            print(error.localizedDescription)
            responseData.append(error)
        } else {
            DispatchQueue.main.sync{
                if let data = data {
                    let resData = (try? JSONSerialization.jsonObject(with: data, options: [])) as? Dictionary <String , Any>
//                    print(resData?["data"] ?? "Nil value")
                    responseData.append(resData?["data"])
//                    responseData.append(data)
                }
            }
        }
//        for i in responseData {
//            print(i,"\n\n")
//        }
    }
        
    session.resume()
//    print(responseData)
    return responseData
}

var postRes:[Any] = postPosts()

print(postRes)


//: [Next](@next)
