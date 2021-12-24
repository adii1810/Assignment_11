

import Foundation
import SQLite3

class sqlHandler{
    
    static let shared = sqlHandler()
    
    let dbpath = "studentDb.sqlite"
    var db:OpaquePointer?
    
    private init(){
        db = openDatabase()
        createTable()
        noticeTable()
    }
    
    func openDatabase() -> OpaquePointer?{
        let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = docURL.appendingPathComponent(dbpath)
        var database:OpaquePointer? = nil
        
        if sqlite3_open(fileURL.path, &database) == SQLITE_OK{
            print("Connection Opened: \(fileURL)")
            return database
        }
        else{
            print("nil")
            return nil
        }
    }
        func createTable(){
            let createTableString = """
                CREATE TABLE IF NOT EXISTS studTable(
                    spId INTEGER PRIMARY KEY AUTOINCREMENT,
                    name TEXT,
                    password TEXT,
                    class TEXT,
                    phoneno TEXT
                    );
                """
            
            var createTableStatement:OpaquePointer? = nil
            
            if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK{
                
                if sqlite3_step(createTableStatement) == SQLITE_DONE{
                    print("Table created")
                }
                else{
                    print("table could not be created")
                }
                //delete statement
                
                sqlite3_finalize(createTableStatement)
                
            }
        }
    
    func noticeTable(){
        let createTableString = """
                CREATE TABLE IF NOT EXISTS noticeTable(
                    noId INTEGER PRIMARY KEY AUTOINCREMENT,
                    title TEXT,
                    notice TEXT,
                    date TEXT
                    );
                """
        
        var createTableStatement:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK{
            
            if sqlite3_step(createTableStatement) == SQLITE_DONE{
                print("Table created")
            }
            else{
                print("table could not be created")
            }
            //delete statement
            
            sqlite3_finalize(createTableStatement)
            
        }
    }
    
    func noticeInsert(notc:Noticeclass, completion: @escaping ((Bool) -> Void)){
        let insertSataementString = "INSERT INTO noticeTable (title,notice,date) VALUES (?,?,?);"
        
        var insertStatement:OpaquePointer? = nil
        
        // Prepare statement
        if sqlite3_prepare_v2(db, insertSataementString, -1, &insertStatement, nil) == SQLITE_OK{
            //Evaluation Sataement
            
            sqlite3_bind_text(insertStatement, 1, (notc.title as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (notc.notice as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (notc.date as NSString).utf8String, -1, nil)
            
            
            if sqlite3_step(insertStatement) == SQLITE_DONE{
                print("Row Inserted")
                completion(true)
            }
            else{
                print("Error!!!!!!!!!!!!!")
                completion(false)
            }
        }else{
            print("Statement could not be prepared")
            completion(false)
        }
        //delete statement
        
        sqlite3_finalize(insertStatement)
        
    }
    
    func insert(stud:Classstud, completion: @escaping ((Bool) -> Void)){
        let insertSataementString = "INSERT INTO studTable (name,password,class,phoneno) VALUES (?,?,?,?);"
        
        var insertStatement:OpaquePointer? = nil
        
        // Prepare statement
        if sqlite3_prepare_v2(db, insertSataementString, -1, &insertStatement, nil) == SQLITE_OK{
            //Evaluation Sataement
            
            sqlite3_bind_text(insertStatement, 1, (stud.Name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (stud.Password as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (stud.Class as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (stud.Phoneno as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE{
                print("Row Inserted")
                completion(true)
            }
            else{
                print("Error!!!!!!!!!!!!!")
                completion(false)
            }
        }else{
            print("Statement could not be prepared")
            completion(false)
        }
        //delete statement
        
        sqlite3_finalize(insertStatement)
        
    }
    
    
    func update(stud:Classstud, completion: @escaping ((Bool) -> Void)){
        let updateSataementString = "UPDATE studTable SET name = ?,password = ?,class = ?,phoneno = ? WHERE spId = ?;"
        
        var updateStatement:OpaquePointer? = nil
        
        // Prepare statement
        if sqlite3_prepare_v2(db, updateSataementString, -1, &updateStatement, nil) == SQLITE_OK{
            //Evaluation Sataement
        
            sqlite3_bind_text(updateStatement, 1, (stud.Name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 2, (stud.Password as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 3, (stud.Class as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 4, (stud.Phoneno as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updateStatement, 5, Int32(stud.Spid))
            if sqlite3_step(updateStatement) == SQLITE_DONE{
                print("Row Update")
                completion(true)
            }
            else{
                print("Error!!!!!!!!!!!!!")
                completion(false)
            }
        }else{
            print("Statement could not be prepared")
            completion(false)
        }
        //delete statement
        
        sqlite3_finalize(updateStatement)
        
    }
    
    func noticeUpdate(notc:Noticeclass, completion: @escaping ((Bool) -> Void)){
        let updateSataementString = "UPDATE noticeTable SET title = ?,notice = ?,date = ? WHERE noId = ?;"
        
        var updateStatement:OpaquePointer? = nil
        
        // Prepare statement
        if sqlite3_prepare_v2(db, updateSataementString, -1, &updateStatement, nil) == SQLITE_OK{
            //Evaluation Sataement
            
            sqlite3_bind_text(updateStatement, 1, (notc.title as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 2, (notc.notice as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 3, (notc.date as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updateStatement, 4, Int32(notc.id))
            if sqlite3_step(updateStatement) == SQLITE_DONE{
                print("Row Update")
                completion(true)
            }
            else{
                print("Error!!!!!!!!!!!!!")
                completion(false)
            }
        }else{
            print("Statement could not be prepared")
            completion(false)
        }
        //delete statement
        
        sqlite3_finalize(updateStatement)
    }
    
    func fetch() -> [Classstud]{
        let fetchSataementString = "SELECT *  FROM studTable;"
        
        var fetchStatement:OpaquePointer? = nil
        
        var stud = [Classstud]()
        
        // Prepare statement
        if sqlite3_prepare_v2(db, fetchSataementString, -1, &fetchStatement, nil) == SQLITE_OK{
            //Evaluation Sataement
            
            while sqlite3_step(fetchStatement) == SQLITE_ROW{
                print("Row Inserted")
                let id = Int(sqlite3_column_int(fetchStatement, 0))
                let name = String(cString: sqlite3_column_text(fetchStatement, 1))
                let password = String(cString: sqlite3_column_text(fetchStatement, 2))
                let Class = String(cString: sqlite3_column_text(fetchStatement, 3))
                let phone = String(cString: sqlite3_column_text(fetchStatement, 4))
                
                stud.append(Classstud(Spid:id,Name: name, Password: password, Class: Class, Phoneno: phone))
                
                print("\(id)|\(name)|\(password)|\(Class)|\(phone)")
            }
        }
        else{
            print("Statement could not be prepared")
            
        }
        //delete statement
        
        sqlite3_finalize(fetchStatement)
        return stud
    }
    
    func noticeFetch() -> [Noticeclass]{
        let fetchSataementString = "SELECT *  FROM noticeTable;"
        
        var fetchStatement:OpaquePointer? = nil
        
        var notc = [Noticeclass]()
        
        // Prepare statement
        if sqlite3_prepare_v2(db, fetchSataementString, -1, &fetchStatement, nil) == SQLITE_OK{
            //Evaluation Sataement
            
            while sqlite3_step(fetchStatement) == SQLITE_ROW{
                print("Row Inserted")
                let id = Int(sqlite3_column_int(fetchStatement, 0))
                let title = String(cString: sqlite3_column_text(fetchStatement, 1))
                let notice = String(cString: sqlite3_column_text(fetchStatement, 2))
                let date = String(cString: sqlite3_column_text(fetchStatement, 3))
               
                
                notc.append(Noticeclass(id: id, title: title, notice: notice, date: date))
                
                print("\(id)|\(title)|\(notice)|\(date)")
            }
        }
        else{
            print("Statement could not be prepared")
            
        }
        //delete statement
        
        sqlite3_finalize(fetchStatement)
        return notc
    }
    
    func fetch(sClass:String) -> [Classstud]{
        let fetchSataementString = "SELECT *  FROM studTable where Class = ?;"
        
        var fetchStatement:OpaquePointer? = nil
        
        var stud = [Classstud]()
        
        // Prepare statement
        if sqlite3_prepare_v2(db, fetchSataementString, -1, &fetchStatement, nil) == SQLITE_OK{
            //Evaluation Sataement
            sqlite3_bind_text(fetchStatement, 1, ( sClass as NSString).utf8String, -1, nil)

            while sqlite3_step(fetchStatement) == SQLITE_ROW{
                print("Row Inserted")
                let id = Int(sqlite3_column_int(fetchStatement, 0))
                let name = String(cString: sqlite3_column_text(fetchStatement, 1))
                let password = String(cString: sqlite3_column_text(fetchStatement, 2))
                let Class = String(cString: sqlite3_column_text(fetchStatement, 3))
                let phone = String(cString: sqlite3_column_text(fetchStatement, 4))
                
                stud.append(Classstud(Spid:id,Name: name, Password: password, Class: Class, Phoneno: phone))
                
                print("\(id)|\(name)|\(password)|\(Class)|\(phone)")
            }
        }
        else{
            print("Statement could not be prepared")
            
        }
        //delete statement
        
        sqlite3_finalize(fetchStatement)
        return stud
    }
    func delete(for id:Int, completion: @escaping ((Bool) -> Void)){
        let deleteSataementString = "DELETE from studTable WHERE spId = ?;"
        
        var deleteStatement:OpaquePointer? = nil
        
        // Prepare statement
        if sqlite3_prepare_v2(db, deleteSataementString, -1, &deleteStatement, nil) == SQLITE_OK{
            //Evaluation Sataement
            
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            
            
            if sqlite3_step(deleteStatement) == SQLITE_DONE{
                print("Row Inserted")
                completion(true)
            }
            else{
                print("Error!!!!!!!!!!!!!")
                completion(false)
            }
        }else{
            print("Statement could not be prepared")
            completion(false)
        }
        //delete statement
        
        sqlite3_finalize(deleteStatement)
        
    }
    func noticeDelete(for id:Int, completion: @escaping ((Bool) -> Void)){
        let deleteSataementString = "DELETE from noticeTable WHERE noId = ?;"
        
        var deleteStatement:OpaquePointer? = nil
        
        // Prepare statement
        if sqlite3_prepare_v2(db, deleteSataementString, -1, &deleteStatement, nil) == SQLITE_OK{
            //Evaluation Sataement
            
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            
            
            if sqlite3_step(deleteStatement) == SQLITE_DONE{
                print("Row Inserted")
                completion(true)
            }
            else{
                print("Error!!!!!!!!!!!!!")
                completion(false)
            }
        }else{
            print("Statement could not be prepared")
            completion(false)
        }
        //delete statement
        
        sqlite3_finalize(deleteStatement)
        
    }
    func changePassword(id:Int,password:String){
        let updateSataementString = "UPDATE studTable SET password = ? WHERE spId = ?;"
        
        var updateStatement:OpaquePointer? = nil
        
        // Prepare statement
        if sqlite3_prepare_v2(db, updateSataementString, -1, &updateStatement, nil) == SQLITE_OK{
            //Evaluation Sataement
            
            
            sqlite3_bind_text(updateStatement, 1, (password as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updateStatement, 2, Int32(id))
            if sqlite3_step(updateStatement) == SQLITE_DONE{
                print("Row Update")
            }
            else{
                print("Error!!!!!!!!!!!!!")
            }
        }else{
            print("Statement could not be prepared")
        }
        //update password
        sqlite3_finalize(updateStatement)
    }
    
    func currNotice()->[Noticeclass]{
        
        var not = [Noticeclass]()
        
        let fetchStatementString = "SELECT * FROM noticeTable ORDER BY noId DESC "
        
        var fetchStatement:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, fetchStatementString, -1, &fetchStatement, nil) == SQLITE_OK{
            while sqlite3_step(fetchStatement) == SQLITE_ROW{
                print("row showed")
                let id = Int(sqlite3_column_int(fetchStatement, 0))
                
                let title = String(cString: sqlite3_column_text(fetchStatement, 1))
                let notice = String(cString: sqlite3_column_text(fetchStatement, 2))
                let date = String(cString: sqlite3_column_text(fetchStatement, 3))
                not.append(Noticeclass(id: id, title: title, notice: notice, date: date))
                print("\(id)|\(title)|\(notice)|\(date)")

            }
        }else{
            print("statement could not prepared")
        }
        sqlite3_finalize(fetchStatement)
        return not
    }
    
    func fetchData(id:Int) -> [Classstud]{
        let fetchSataementString = "SELECT * FROM studTable where spId = ?;"
        
        var fetchStatement:OpaquePointer? = nil
        
        var stud = [Classstud]()
        
        // Prepare statement
        if sqlite3_prepare_v2(db, fetchSataementString, -1, &fetchStatement, nil) == SQLITE_OK{
            //Evaluation Sataement
            sqlite3_bind_int(fetchStatement, 1, Int32(id))

            
            while sqlite3_step(fetchStatement) == SQLITE_ROW{
                print("Row Inserted")
                let id = Int(sqlite3_column_int(fetchStatement, 0))
                let name = String(cString: sqlite3_column_text(fetchStatement, 1))
                let password = String(cString: sqlite3_column_text(fetchStatement, 2))
                let Class = String(cString: sqlite3_column_text(fetchStatement, 3))
                let phone = String(cString: sqlite3_column_text(fetchStatement, 4))
                
                stud.append(Classstud(Spid:id,Name: name, Password: password, Class: Class, Phoneno: phone))
                
                print("\(id)|\(name)|\(password)|\(Class)|\(phone)")
            }
        }
        else{
            print("Statement could not be prepared")
            
        }
        //delete statement
        
        sqlite3_finalize(fetchStatement)
        return stud
    }
    
}
