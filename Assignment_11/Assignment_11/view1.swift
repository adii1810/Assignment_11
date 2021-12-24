

import UIKit

class view1: UIViewController {

    var name1 : Classstud?
    private let Spid:UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .lightGray
        txt.placeholder = "SpId"
        txt.textAlignment = .center
        return txt
    }()
    
    private let Name:UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .lightGray
        txt.placeholder = "Name"
        txt.textAlignment = .center
        return txt
    }()
    
    private let Password:UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .lightGray
        txt.placeholder = "Password"
        txt.textAlignment = .center
        return txt
    }()
    
    private let Class:UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .lightGray
        txt.placeholder = "Class"
        txt.textAlignment = .center
        return txt
    }()
    
    private let PhoneNo:UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .lightGray
        txt.placeholder = "Phone No"
        txt.textAlignment = .center
        return txt
    }()
    
    private let button:UIButton = {
        let btn = UIButton()
        btn.setTitle("Save", for: .normal)
        btn.addTarget(self, action: #selector(saveStud), for: .touchUpInside)
        btn.backgroundColor = .green
        return btn
    }()
    
    @objc private func saveStud(){
        let name = Name.text
        let password = Password.text
        let Classs = Class.text
        let phone = PhoneNo.text
        
//        if let stud = name1{
//            let updateemp = Classstud(Name: name ?? "0", Password: password!, Class: Classs!, Phoneno: phone!)
//            print("Update\(updateemp)")
//            update(stud: stud)
//        }
//        else{
            print("Insert \(name),\(password),\(Classs),\(phone)")
            let insert1 = Classstud(Spid: 0,Name: name!, Password: password!, Class: Classs!, Phoneno: phone!)
            insert(stud: insert1)
//        }
        
    }
    
    private func insert(stud: Classstud){
        sqlHandler.shared.insert(stud: stud){ success in
            if success{
                print("insert successfull")
                self.reset()
            }
            else {
                print("insert Unsuccessfull")
            }
            
        }
    }
    
//    private func update(stud: Classstud){
//        sqlHandler.shared.update(stud: stud) {success in
//            if success{
//                if success{
//                    print("update successfull")
//                    self.reset()
//                }
//                else {
//                    print("update Unsuccessfull")
//                }
//            }
//        }
//    }
    
    private func reset(){
        name1 = nil
        Name.text = ""
        Password.text = ""
        Class.text = ""
        PhoneNo.text = ""
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        view.addSubview(Spid)
        view.addSubview(Name)
        view.addSubview(Password)
        view.addSubview(Class)
        view.addSubview(PhoneNo)
        view.addSubview(button)
    }
    
    override func viewDidLayoutSubviews() {
        Spid.frame = CGRect(x: 10, y: 70, width: view.frame.width - 20, height: 40)
        Name.frame = CGRect(x: 10, y: 120, width: view.frame.width - 20, height: 40)
        Password.frame = CGRect(x: 10, y: 170, width: view.frame.width - 20, height: 40)
        Class.frame = CGRect(x: 10, y: 220, width: view.frame.width - 20, height: 40)
        PhoneNo.frame = CGRect(x: 10, y: 270, width: view.frame.width - 20, height: 40)
        button.frame = CGRect(x: 10, y: 400, width: view.frame.width - 20, height: 40)
    }
    

    

}
