import Cocoa
//import Combine

var jsonData: Data?

struct Test: Codable {
//    var id: Int
//    var postId: Int
//    var email: String
//    var name: String
//    var body: String
//    var msg: String
    var base: String
    
    enum CodingKeys: String, CodingKey {
//        case msg = "msgtxt"
        case base = "baseURL"
    }
}
//class s {
//
//}

func getPosts() {
//    63bfdef501a72b59f248a4e3
    guard let url = URL(string: "https://run.mocky.io/v3/75390a47-07c3-4bcb-8ae7-b2cb14cf3ce7?") else {
        print("Invalid link...")
        return
    }
    var req = URLRequest(url: url)
//    req.allHTTPHeaderFields = ["X-Master-Key":"$2b$10$tJwbePxDZPklOJ4xffLoxeWQ.JkRAYdaObwskSbyzKzRTYoSa8qHK"]
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
                //                print(try? JSONSerialization.jsonObject(with: data))
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
                print(jsonData ?? "")
                //                let resData = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                ////                let result = resData as! Dictionary <String , Any>
                //                print(resData)
                //                print(result["record"] ?? [])
            }
        }
    }
    session.resume()
}

getPosts()

struct Employee: Codable {
    var name: String
    var role: String
}

func postPosts() {
    let parameter = [
        "Name": "Naresh",
        "Role": "Developer"
    ]
    
    guard let url = URL(string: "https://api.jsonbin.io/v3/b") else {
        print("Invalid link...")
        return
    }
    
    var req = URLRequest(url: url)
    req.httpMethod = "POST"
    req.setValue("Application/json", forHTTPHeaderField: "Content-Type")
    req.httpBody = try? JSONEncoder().encode(Employee(name: "Naresh", role: "Developer"))
//    req.httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: [])
//    req.httpBody = try? JSONEncoder().encode(parameter)
//    req.allHTTPHeaderFields = ["X-Api-Key":"PMAK-63c678bd54f0fb5b737ec3a9-dd53b9455cd2dda094df9bf13b04b64fa3"]
    req.allHTTPHeaderFields = ["X-Master-Key":"$2b$10$tJwbePxDZPklOJ4xffLoxeWQ.JkRAYdaObwskSbyzKzRTYoSa8qHK"]
    
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
                    print(resData?["record"] ?? "Nil value", Thread.isMainThread)
                }
            }
        }
    }
        
    session.resume()
}

postPosts()

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
    }download["txt"]?.pause()
    download["video"]?.pause()
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
        try? FileManager.default.moveItem(at: location, to: self.filePath!)
        
//        print(session)
//                let dataFromURL = NSData(contentsOf: fileURL)
//                dataFromURL?.write(to: self.filePath!, atomically: true)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Int(Float(totalBytesWritten) / Float(totalBytesExpectedToWrite) * 100)
        print("Downloading: \(progress)%")
    }
    
}

let imageURL = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.i-Xdb3eu9ihga0frrt1tWQHaEo%26pid%3DApi&f=1&ipt=da7e5ffac6ed05f9083e637a9b5c7571fac00eaf72b65ec6c74ff44740bf8420&ipo=images"

let textURL = "https://jsonplaceholder.typicode.com/posts"

let videoURL = "https://s32.uptofiles.net/files/Tamil%20HD%20Mobile%20Movies/Vikram%20(1986)/Vikram%20(Original)/Vikram%20(640x360)/Vikram%201986%20HD%20Sample.mp4"


var download: [String: DownloadImage] = ["img": DownloadImage(imageURL, "Images/hd.jpg"), "txt": DownloadImage(textURL, "Images/json.txt"), "video": DownloadImage(videoURL, "Images/hd2.mp4")]

download["img"]?.downloader()
download["txt"]?.downloader()
download["video"]?.downloader()
download["img"]?.pause()
download["txt"]?.pause()
download["video"]?.pause()
download["img"]?.resume()
download["video"]?.resume()
download["txt"]?.resume()
download["img"]?.pause()
download["img"]?.resume()

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

var upload =  UploadImage()

//upload.uploader()
//upload.pause()
