import Cocoa
//import Combine
import CommonCrypto

var jsonData: Data?

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

func getPosts() {
//    63bfdef501a72b59f248a4e3
    guard let url = URL(string: "http://demo8925853.mockable.io/") else {
        print("Invalid link...")
        return
    }
    var req = URLRequest(url: url)
//    req.allHTTPHeaderFields = ["X-Master-Key":"$2b$10$tJwbePxDZPklOJ4xffLoxeWQ.JkRAYdaObwskSbyzKzRTYoSa8qHK"]
//    req.allHTTPHeaderFields = ["userName":"asdf@asdf.com", "password": "1234567890"]
    req.setValue("Basic asdf@asdf.com:1234567890", forHTTPHeaderField: "Authorization")
    req.httpMethod = "GET"
    
    var session = URLSession.shared.dataTask(with: req) {
        data, response, error in
        
        print(Thread.current)
        let resResult = response as? HTTPURLResponse
        
        print("Status code:",resResult?.statusCode ?? 0,"(\"",HTTPURLResponse.localizedString(forStatusCode: resResult!.statusCode),"\")")
        print()
        
        if let error = error {
            print(error.localizedDescription)
        } else {
            if let data = data {
                //                print(type(of: data))
                //                jsonData = data
//                                print(try? JSONSerialization.jsonObject(with: data))
                do {
                    var testObj = try JSONDecoder().decode(Test.self, from: data)
                    print(testObj)
                } catch {
                    print(error)
                }
                
                //                for obj in testObj! {
                //                    print(obj)
                //                }
                //                debugPrint(testObj)
//                print(jsonData ?? "")
                //                let resData = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                ////                let result = resData as! Dictionary <String , Any>
                //                print(resData)
                //                print(result["record"] ?? [])
            }
        }
    }
    session.resume()
}

//getPosts()

struct Employee: Codable {
    var name: String
    var role: String
}

func postPosts() {
    let parameter = [
        "Name": "Naresh",
        "Role": "Developer"
    ]
    
    guard let url = URL(string: "https://postman-echo.com/post") else {
        print("Invalid link...")
        return
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
        let resResult = response as? HTTPURLResponse
        
        print(HTTPURLResponse.localizedString(forStatusCode: resResult!.statusCode))
        print("Status code:",resResult?.statusCode ?? 0)

        if let error = error {
            print(error.localizedDescription)
        } else {
            DispatchQueue.main.sync{
                if let data = data {
                    let resData = (try? JSONSerialization.jsonObject(with: data, options: [])) as? Dictionary <String , Any>
                    print(resData?["data"] ?? "Nil value")
                }
            }
        }
    }
        
    session.resume()
}

//postPosts()

func putPosts() {
    let parameter = [
        "Name": "Naveen",
        "Role": "Manager"
    ]
    
    guard let url = URL(string: "https://api.jsonbin.io/v3/b/63c6456701a72b59f24cd3ad") else {
        print("Invalid link...")
        return
    }
    
    var req = URLRequest(url: url)
    req.httpMethod = "PUT"
    req.setValue("Application/json", forHTTPHeaderField: "Content-Type")
    req.httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: [])
//    req.httpBody = try? JSONEncoder().encode(parameter)
    req.allHTTPHeaderFields = ["X-Master-Key":"$2b$10$tJwbePxDZPklOJ4xffLoxeWQ.JkRAYdaObwskSbyzKzRTYoSa8qHK"]
    
    var session = URLSession.shared.dataTask(with: req) {
        data, response, error in

        if let error = error {
            print(error.localizedDescription)
        } else {
            let res = response as? HTTPURLResponse
            print(HTTPURLResponse.localizedString(forStatusCode: res!.statusCode))
            print("Status code:",res?.statusCode ?? 0)
//            DispatchQueue.main.sync{
//                if let data = data {
//                    let resData = (try? JSONSerialization.jsonObject(with: data, options: [])) as? Dictionary <String , Any>
//                    print(resData?["record"] ?? "Nil value")
//                }
//            }
        }
    }
        
    session.resume()
}

// putPosts()

class DownloadImage: NSObject, URLSessionDownloadDelegate {
    var apiUrl: String
    var filePath: URL?
    var filePathEnd: String
    
    init(_ url: String, _ fileUrl: String) {
        self.apiUrl = url
        self.filePathEnd = fileUrl
    }
//    "Images/hd2.mp4"
    lazy var session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
    var downloadObj: URLSessionDownloadTask?
    
    var resumeData: Data?
    
    func downloader() {
        self.filePath = try? FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(String(filePathEnd))
        
        guard let url = URL(string: videoURL) else {
            print("Invalid URL...")
            return
        }
//        let session = URLSession.shared.downloadTask(with: url) {
//            fileURL, response, error in
//
//            if let error = error {
//                print("Error:", error.localizedDescription)
//            } else {
//                if let fileURL = fileURL {
//                    print("URL: \"\(fileURL)\"")
//                }
//                else {
//                    print("No url")
//                }
//            }
//        }
        
        downloadObj = session.downloadTask(with: url)
        downloadObj?.earliestBeginDate = Date().addingTimeInterval(5)
        
        downloadObj?.resume()
    }
    
    func pause() {
        downloadObj?.cancel { [weak self]
            resumeDataOrNil in
            
            guard let resumeData = resumeDataOrNil else {
                print("No downloads currently...")
                return
            }
            print(resumeData)
            self?.downloadObj = self?.session.downloadTask(withResumeData: resumeData)
            print(self?.downloadObj ?? "")
            self?.resumeData = resumeData
        }
    }
    
    func resume(){
        guard let resumeDel = downloadObj else {
            print("Resume fail...")
            return
        }
        resumeDel.resume()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Downloading...")
        print(Thread.isMainThread)
        try? FileManager.default.moveItem(at: location, to: self.filePath!)
        
//        print(session)
//                let dataFromURL = NSData(contentsOf: fileURL)
//                dataFromURL?.write(to: self.filePath!, atomically: true)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Int(Float(totalBytesWritten) / Float(totalBytesExpectedToWrite) * 100)
        print("Downloading: \(progress)%", Thread.isMainThread)
    }
    
}

let imageURL = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.i-Xdb3eu9ihga0frrt1tWQHaEo%26pid%3DApi&f=1&ipt=da7e5ffac6ed05f9083e637a9b5c7571fac00eaf72b65ec6c74ff44740bf8420&ipo=images"

let textURL = "https://jsonplaceholder.typicode.com/posts"

let videoURL = "https://s32.uptofiles.net/files/Tamil%20HD%20Mobile%20Movies/Vikram%20(1986)/Vikram%20(Original)/Vikram%20(640x360)/Vikram%201986%20HD%20Sample.mp4"


//var download: [String: DownloadImage] = ["img": DownloadImage(imageURL, "Images/hd.jpg"), "txt": DownloadImage(textURL, "Images/json.txt"), "video": DownloadImage(videoURL, "Images/hd2.mp4")]

//download["img"]?.downloader()
//download["txt"]?.downloader()
//download["video"]?.downloader()
//download["img"]?.pause()
//download["txt"]?.pause()
//download["video"]?.pause()
//download["img"]?.resume()
//download["video"]?.resume()
//download["txt"]?.resume()
//download["img"]?.pause()
//download["img"]?.resume()

//
//download["img"]?.resume()
//download["video"]?.resume()
//download["txt"]?.resume()
////2023-01-17 13:11:26 +0000

//print(Date().addingTimeInterval(3 * 60))



//download.pause()
//download.resume()
//
//download.resume()

//URLSession.shared.uploadTask(with: <#T##URLRequest#>, from: <#T##Data#>)
//URLSession.shared.streamTask(withHostName: <#T##String#>, port: <#T##Int#>)

//getPosts()
//postPosts()


class UploadImage: NSObject, URLSessionDelegate, URLSessionTaskDelegate {
    let parameter = [
        "id": "5",
        "Name": "Naresh",
        "Role": "Developer"
    ]
    var url: String = "https://api.jsonbin.io/v3/b"
    var resumeData: Data?
//    var filePathEnd: String
    
//    init(_ url: String, _ fileUrl: String) {
//        self.apiUrl = url
//        self.filePathEnd = fileUrl
//    }
    lazy var session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
    var uploadObj: URLSessionUploadTask?
    
    func uploader() {
//        self.filePath = try? FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(String(filePathEnd))
        
        guard let url = URL(string: self.url) else {
            print("Invalid link...")
            return
        }
        var req = URLRequest(url: url)
        req.allHTTPHeaderFields = ["X-Master-Key":"$2b$10$tJwbePxDZPklOJ4xffLoxeWQ.JkRAYdaObwskSbyzKzRTYoSa8qHK"]
        req.httpMethod = "POST"
        req.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let data = try? JSONSerialization.data(withJSONObject: parameter)
//        let session = URLSession.shared.downloadTask(with: url) {
//            fileURL, response, error in
//
//            if let error = error {
//                print("Error:", error.localizedDescription)
//            } else {
//                if let fileURL = fileURL {
//                    print("URL: \"\(fileURL)\"")
//                }
//                else {
//                    print("No url")
//                }
//            }
////        }
        print(data!, type(of: data!))
//        if let data = data {
        uploadObj = session.uploadTask(with: req, from: jsonData) {
            data , res , error in
            let resResult = res as? HTTPURLResponse
            
            print(resResult?.statusCode ?? "")
        }
//        }
        uploadObj?.resume()
    }
    
    func pause() {
        uploadObj?.cancel()
    }
    
//    func resume() {
//        session.downloadTask(withResumeData: resumeData!).resume()
//    }
//
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
//        print("Downloading...")
//        try? FileManager.default.moveItem(at: location, to: self.filePath!)
//
////        print(session)
////                let dataFromURL = NSData(contentsOf: fileURL)
////                dataFromURL?.write(to: self.filePath!, atomically: true)
//    }
    
//    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
//        print(session)
//    }
//
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        print("sent:", totalBytesSent, "from:", totalBytesExpectedToSend)

        let progress = Int(Float(totalBytesSent) / Float(totalBytesExpectedToSend) * 100)
        print("Uploading: \(progress)%")
    }
    
}

//var upload =  UploadImage()

//upload.uploader()
//upload.pause()



//"https://accounts.google.com/v3/signin/identifier?dsh=S872581764%3A1674206652241309&authuser=0&continue=https%3A%2F%2Fmyaccount.google.com%2F&ec=GAlAwAE&hl=en&service=accountsettings&flowName=GlifWebSignIn&flowEntry=AddSession"

//"https://accounts.google.com/v3/signin/challenge/pwd?TL=AC7eWV3mtlUjOvV-QguB2X2nueHqCM4wP60LjHxZhkXuFGBNHwa1NUq3yoYfE5AY&checkConnection=youtube%3A222%3A0&checkedDomains=youtube&cid=2&continue=https%3A%2F%2Fmyaccount.google.com%2F&dsh=S872581764%3A1674206652241309&flowEntry=AddSession&flowName=GlifWebSignIn&hl=en&pstMsg=1&service=accountsettings&authuser=0"


//"https://mockapi.io/login"
//"ddasfasf@asdfsafs.com"



extension Data {
    var hexString: String {
        return map { String(format: "%02hhx", $0) }.joined()
    }

    var sha256: Data {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        self.withUnsafeBytes({
            _ = CC_SHA256($0, CC_LONG(self.count), &digest)
        })
        return Data(bytes: digest)
    }
}

extension String {
    func sha256(salt: String) -> Data {
        return (self + salt).data(using: .utf8)!.sha256
    }

}


class Auth: NSObject, URLSessionDelegate {
//    var data: NSMutableData = NSMutableData()
    var isSigningIn: Bool?
    var urlComponent = URLComponents()
    lazy var session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
    
    func authPostPosts() {
        let hash = "test".sha256(salt: "salt").hexString
        print(hash)

        urlComponent.scheme = "https"
        urlComponent.host = "postman-echo.com"
        urlComponent.path = "/basic-auth"
        
        let username = "postman"
        let password = "password"
        urlComponent.user = username
        urlComponent.password = password
        urlComponent.queryItems = [URLQueryItem(name: "name", value: "falsdfj"),URLQueryItem(name: "name", value: "falsdfj")]
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        print(loginString,":",base64LoginString)

        guard let url = urlComponent.url else {
            print("Invalid link...")
            return
        }
        
        print(url)
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
//        req.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
//        req.setValue("Bearer \(hash)", forHTTPHeaderField: "Authorization")
        
        isSigningIn = true

        URLSession.shared.dataTask(with: req) {
            data, response, error in
            
            let resResult = response as? HTTPURLResponse
            print(HTTPURLResponse.localizedString(forStatusCode: resResult!.statusCode))
            print("Status code:",resResult?.statusCode ?? 0)

            if let error = error {
                print(error.localizedDescription)
            } else {
//                print(data!)
                DispatchQueue.main.sync{
                    if let data = data {
                        let resData = (try? JSONSerialization.jsonObject(with: data, options: []))
                        print(resData ?? "Nil")
//                        print(resData?["name"] ?? "Nil value", Thread.isMainThread)
                    }
                }
            }
//            DispatchQueue.main.async {
//                self?.isSigningIn = false
//                if let data = data {
//                    print(data)
//                }
//            }
        }.resume()
            
        //    req.httpBody = try? JSONEncoder().encode(Employee(name: "Naresh", role: "Developer"))
        //    req.httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: [])
        //    req.httpBody = try? JSONEncoder().encode(parameter)
        //    req.allHTTPHeaderFields = ["X-Api-Key":"PMAK-63c678bd54f0fb5b737ec3a9-dd53b9455cd2dda094df9bf13b04b64fa3"]
        //    req.allHTTPHeaderFields = ["X-Master-Key":"$2b$10$tJwbePxDZPklOJ4xffLoxeWQ.JkRAYdaObwskSbyzKzRTYoSa8qHK"]
        
//        var session = URLSession.shared.dataTask(with: req) {
//            data, response, error in
//            let resResult = response as? HTTPURLResponse
//
//            print(HTTPURLResponse.localizedString(forStatusCode: resResult!.statusCode))
//            print("Status code:",resResult?.statusCode ?? 0)
//
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                DispatchQueue.main.sync{
//                    if let data = data {
//                        let resData = (try? JSONSerialization.jsonObject(with: data, options: [])) as? Dictionary <String , Any>
//                        print(resData?["record"] ?? "Nil value", Thread.isMainThread)
//                    }
//                }
//            }
//        }
        
//        session.resume()
    }
}

var auth = Auth()
auth.authPostPosts()

//print(Int(CC_SHA1_DIGEST_LENGTH))

//
//let username = "user"
//let password = "pass"
//let loginString = String(format: "%@:%@", username, password)
//let loginData = loginString.data(using: String.Encoding.utf8)!
//let base64LoginString = loginData.base64EncodedString()
//
//// create the request
//let url = URL(string: "http://www.example.com/")!
//var request = URLRequest(url: url)
//request.httpMethod = "POST"
//request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
//
//// fire off the request
//// make sure your class conforms to NSURLConnectionDelegate
//let urlConnection = NSURLConnection(request: request, delegate: self)


//extension Data {
//
//    var hexString: String {
//        return map { String(format: "%02hhx", $0) }.joined()
//    }
//
//    var sha256: Data {
//        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
//        self.withUnsafeBytes({
//            _ = CC_SHA256($0, CC_LONG(self.count), &digest)
//        })
//        return Data(bytes: digest)
//    }
//
//}
//
//extension String {
//
//    func sha256(salt: String) -> Data {
//        return (self + salt).data(using: .utf8)!.sha256
//    }
//
//}
//
//let hash = "test".sha256(salt: "salt").hexString
//print(hash)
