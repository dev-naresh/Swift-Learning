import Cocoa
import SQLite3



let dbPath = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("OOPSprogram/studentsDB.sqlite")


func openDatabase() -> OpaquePointer? {
  var db: OpaquePointer?
  guard let dbPath = dbPath else {
    print("part1DbPath is nil.")
    return nil
  }
    if sqlite3_open(dbPath.path, &db) == SQLITE_OK {
    print("Successfully opened connection to database at \(dbPath)")
    return db
  } else {
    print("Unable to open database.")
//    Database.current.finishExecution()
  }
    return db
}

let db = openDatabase()


let createTableString = """
CREATE TABLE Student(
StudentId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
StudentName CHAR(255));
"""


func createTable() {
  var createTableStatement: OpaquePointer?
  if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
    if sqlite3_step(createTableStatement) == SQLITE_DONE {
      print("\nStudent table created.")
    } else {
      print("\nStudent table is not created.")
    }
  } else {
    print("\nCREATE TABLE statement is not prepared.")
  }
  sqlite3_finalize(createTableStatement)
}

createTable()

//let insertStatementString = "INSERT INTO Student (StudentId, StudentName) VALUES (?, ?);"
let insertStatementString = "INSERT INTO Student (StudentName) VALUES (?);"

func insert() {
  var insertStatement: OpaquePointer?
  if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
//    let id: Int32 = 1
    let name: NSString = "Naresh"
//    sqlite3_bind_int(insertStatement, 1, id)
    sqlite3_bind_text(insertStatement, 1, name.utf8String, -1, nil)
//      print(SQLITE_DONE)
    if sqlite3_step(insertStatement) == SQLITE_DONE {
      print("\nSuccessfully inserted row.")
    } else {
      print("\nCould not insert row.")
    }
  } else {
    print("\nINSERT statement is not prepared.")
  }
  sqlite3_finalize(insertStatement)
}

insert()

func multipleInsert() {
  var insertStatement: OpaquePointer?
  let names: [NSString] = ["Ray", "Chris", "Martha", "Danielle"]
  if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
    print("\n")
    for (index, name) in names.enumerated() {
//      let id = Int32(index + 1)
//        print(id)
//      sqlite3_bind_int(insertStatement, 1, id)
      sqlite3_bind_text(insertStatement, 1, name.utf8String, -1, nil)
      if sqlite3_step(insertStatement) == SQLITE_DONE {
        print("Successfully inserted row.")
      } else {
        print("Could not insert row.")
      }
      sqlite3_reset(insertStatement)
    }
    sqlite3_finalize(insertStatement)
  } else {
    print("\nINSERT statement is not prepared.")
  }
}

multipleInsert()
