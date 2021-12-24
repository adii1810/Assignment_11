//
//  viewDetails.swift
//  Assignment_11
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class viewDetails: UIViewController {

    var name1 = [Classstud]()
    
    
    private let Name:UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .lightGray
        txt.placeholder = "Name"
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
    
   
    
    @objc private func saveStud(){
        let name = Name.text!
        
        let Classs = Class.text!
        let phone = PhoneNo.text!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        
        view.addSubview(Name)
       
        view.addSubview(Class)
        view.addSubview(PhoneNo)
       
        let id = Int( UserDefaults.standard.string(forKey: "uname")!)
        name1 = sqlHandler.shared.fetchData(id: id!)
        Name.text = name1[0].Name
        Class.text = name1[0].Class
        PhoneNo.text = name1[0].Phoneno
       
    }
    
    override func viewDidLayoutSubviews() {
        Name.frame = CGRect(x: 10, y: 120, width: view.frame.width - 20, height: 40)
        Class.frame = CGRect(x: 10, y: 220, width: view.frame.width - 20, height: 40)
        PhoneNo.frame = CGRect(x: 10, y: 270, width: view.frame.width - 20, height: 40)
        
    }

}
