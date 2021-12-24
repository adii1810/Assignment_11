//
//  sView1.swift
//  Assignment_11
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit


class sView1: UIViewController {
    
    var name1 : Classstud?
    private let lblUser:UILabel = {
        let lbl = UILabel()
        lbl.text = "Password "
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .black
        return lbl
    }()
    
    private let lblPassword:UILabel = {
        let lbl = UILabel()
        lbl.text = "Confirm password  "
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .black
        return lbl
    }()
    
    private let txtUser:UITextField = {
        let txt = UITextField()
        txt.layer.cornerRadius = 5
        txt.placeholder = " Password"
        txt.backgroundColor = .white
        txt.textColor = .black
       // txt.addTarget(self, action: #selector(lblChange), for: .allTouchEvents)
        return txt
    }()
    
    private let txtPassword:UITextField = {
        let txt = UITextField()
        txt.layer.cornerRadius = 5
        
        txt.textColor = .black
        txt.placeholder = "Confirm Password"
        txt.backgroundColor = .white
        //txt.addTarget(self, action: #selector(lbl1Change), for: .allTouchEvents)
        return txt
    }()
    
    private let submitBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Change Password", for: .normal)
        btn.backgroundColor = .green
        btn.addTarget(self, action: #selector(subFunc), for: .touchUpInside)
        return btn
    }()
    @objc private func subFunc(){
        
        let password = txtPassword.text
        let id = Int(UserDefaults.standard.string(forKey: "uname")!)
        print(id)
        
        sqlHandler.shared.changePassword(id: id!, password: password!)
        
            
        }
        
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(lblUser)
        view.addSubview(lblPassword)
        view.addSubview(txtUser)
        view.addSubview(txtPassword)
        view.addSubview(submitBtn)
     
    }
    
    override func viewDidLayoutSubviews() {
        lblUser.frame = CGRect(x: 25, y: 295, width: view.frame.width - 50, height: 30)
        txtUser.frame = CGRect(x: 25, y: 335, width: view.frame.width - 50, height: 50)
        
        lblPassword.frame = CGRect(x: 25, y: 396, width: view.frame.width - 50, height: 30)
        txtPassword.frame = CGRect(x: 25, y: 436, width: view.frame.width - 50, height: 50)
        
        submitBtn.frame = CGRect(x: 25, y: 496, width: view.frame.width - 50, height: 50)
    }
}

