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
//sqlite3_close(db)
//let db2 = openDatabase()

let createTableString = """
CREATE TABLE StudentLastName(
StudentId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
lastName CHAR(255));
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

let insertStatementString = "INSERT INTO Studentlastname (lastName) VALUES (?);"
//let insertStatementString = "INSERT INTO StudentLastName (lastName) VALUES (?);"

func insert() {
  var insertStatement: OpaquePointer?
  if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
//    let id: Int32 = 1
    let name: NSString = "kumar"
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

func multipleInsert() {
  var insertStatement: OpaquePointer?
//  let names: [NSString] = ["Ray", "Chris", "Martha", "Danielle"]
  let names: [NSString] = ["Mystero", "Hemsworth", "Checabva", "Colby"]
  if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
    print("\n")
      for (_, name) in names.enumerated() {
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


let updateStatementString = """
UPDATE student
SET studentName = 'Naveen'
WHERE studentId = 3;
"""

func update() {
    var updateStatement: OpaquePointer?
    
    if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
        print("Update prepare successful")
        if sqlite3_step(updateStatement) == SQLITE_DONE {
            print("Successfully updated the name")
        } else {
            print("failed")
        }
    }
}

let selectStatementString = """
SELECT *
FROM student
WHERE studentId = 3;
"""

func selectStudent() {
    var selectStatement: OpaquePointer?
    
    if sqlite3_prepare_v2(db, selectStatementString, -1, &selectStatement, nil) == SQLITE_OK {
        if sqlite3_step(selectStatement) == SQLITE_ROW {
            print("{", Int(sqlite3_column_int(selectStatement, 0)), terminator: ": ")
            print(String(cString: sqlite3_column_text(selectStatement, 1)), "}")
        }
        else {
            print("NIl")
        }
//    }else {
        print(String(cString: sqlite3_errmsg(db)))
    }
    
}

let joinStatementString = """
SELECT studentid, studentname, lastname FROM studentfirstname INNER JOIN studentlastname
 ON studentfirstname.studentid = studentlastname.lastnameid;
"""

//let joinStatementString = """
//SELECT studentid, studentname, lastname FROM studentfirstname OUTER JOIN studentlastname
//ON studentfirstname.studentid = studentlastname.lastnameid;
//"""

//let joinStatementString = """
//SELECT studentid, studentname, lastname FROM studentfirstname RIGHT OUTER JOIN studentlastname
// ON studentfirstname.studentid = studentlastname.lastnameid;
//"""

//let joinStatementString = """
//SELECT studentid, studentname, lastname FROM studentfirstname CROSS JOIN studentlastname;
//"""

func join() {
    var joinStatement: OpaquePointer?
    
    if sqlite3_prepare_v2(db, joinStatementString, -1, &joinStatement, nil) == SQLITE_OK {
        while sqlite3_step(joinStatement) == SQLITE_ROW {
            print("{", String(cString: sqlite3_column_text(joinStatement, 0)), terminator: ": ")
            print(String(cString: sqlite3_column_text(joinStatement, 1)), terminator: " ")
            if sqlite3_column_text(joinStatement, 2) != nil {
                print(String(cString: sqlite3_column_text(joinStatement, 2)), "}")
            } else {
                print(" }")
            }
        }
    }else {
        print(String(cString: sqlite3_errmsg(db)))
    }
}

//createTable()
//insert()
multipleInsert()

//536365
//85123A
//WHITE HANGING HEART T-LIGHT HOLDER
//6
//12/01/2010 08:26:00
//2.55
//17850
//United Kingdom
join()

//update()
//selectStudent()


