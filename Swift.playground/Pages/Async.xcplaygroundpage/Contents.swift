//: [Previous](@previous)

import Foundation

func downloadPhoto() -> String {
    return "Photo"
}

func listPhotos() -> [String] {
    ["Hello", "hii"]
}


Task {
    async let photo1 = downloadPhoto()
    async let photo2 = downloadPhoto()
    async let photo3 = downloadPhoto()
    
    print(await photo1)
    print(await photo2)
    print(await photo3)
}

struct SlowDivideOperation {
    
    let name: String
    let a: Double
    let b: Double
    let sleepDuration: UInt64
    
    func execute() async -> Double {
        
        // Sleep for x seconds
        await Task.sleep(sleepDuration * 1_000_000_000)
        
        let value = a / b
        return value
    }
}

let operations = [
    SlowDivideOperation(name: "operation-0", a: 5, b: 1, sleepDuration: 5),
    SlowDivideOperation(name: "operation-1", a: 14, b: 7, sleepDuration: 1),
    SlowDivideOperation(name: "operation-2", a: 8, b: 2, sleepDuration: 3),
]

Task {
    
    let allResults = await withTaskGroup(of: (String, Double).self,
                                         returning: [String: Double].self,
                                         body: { taskGroup in
        
        // Loop through operations array
        for operation in operations {
            
            // Add child task to task group
            taskGroup.addTask {
                
                // Execute slow operation
                let value = await operation.execute()
                
                // Return child task result
                print(operation.name, value)
                return (operation.name, value)
            }
            
        }
        
        var childTaskResults = [String: Double]()
        for await result in taskGroup {
            // Set operation name as key and operation result as value
            childTaskResults[result.0] = result.1
        }
        
        // Task group finish running & return task group result
        return childTaskResults
        
    })
    print(allResults)
}



//await withTaskGroup(of: String) { taskGroup in
//    async let photoNames = listPhotos()
//    for try await name in await photoNames {
//        taskGroup.addTask { await downloadPhoto()
//            print(name)
//        }
//    }
//}

//: [Next](@next)
