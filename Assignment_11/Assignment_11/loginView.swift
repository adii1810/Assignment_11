//
//  loginView.swift
//  Assignment_11
//
//  Created by DCS on 16/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class loginView: UIViewController {

    
    private var lbl1Flag = 0
    private var lbl2Flag = 0
    
    private let lblUser:UILabel = {
        let lbl = UILabel()
        lbl.text = "Username "
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .black
        return lbl
    }()
    
    private let lblPassword:UILabel = {
        let lbl = UILabel()
        lbl.text = "Password  "
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .black
        return lbl
    }()
    
    private let txtUser:UITextField = {
        let txt = UITextField()
        txt.layer.cornerRadius = 5
        txt.placeholder = " Username"
        txt.backgroundColor = .white
        txt.textColor = .black
        txt.addTarget(self, action: #selector(lblChange), for: .allTouchEvents)
        return txt
    }()
    
    private let txtPassword:UITextField = {
        let txt = UITextField()
        txt.layer.cornerRadius = 5
        
        txt.textColor = .black
        txt.placeholder = "Password"
        txt.backgroundColor = .white
        txt.addTarget(self, action: #selector(lbl1Change), for: .allTouchEvents)
        return txt
    }()
    
    private let submitBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = .green
        btn.addTarget(self, action: #selector(subFunc), for: .touchUpInside)
        return btn
    }()
    
    @objc private func subFunc(){
        
        if (txtUser.text == "Admin" && txtPassword.text == "Admin"){
        let vc = indexView()
        navigationController?.pushViewController(vc, animated: true)
//        present(vc, animated: true, completion: nil)
        }
        else{
            UserDefaults.standard.setValue(txtUser.text, forKey: "uname")
            UserDefaults.standard.setValue(txtPassword.text, forKey: "pass")
            let vc = studentIndex()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc private func lblChange(){
        UIView.animate(withDuration: 1.5, animations: {
            //self.lblUser.transform = self.lblUser.transform.scaledBy(x: 1.2 , y: 1.2)
            self.lblUser.transform = self.lblUser.transform.translatedBy(x: 7, y: 7)
            self.lblUser.font = UIFont.boldSystemFont(ofSize: 25)
            self.lblPassword.font = UIFont.boldSystemFont(ofSize: 20)
        })
        lblUser.textColor = .red
        lblPassword.textColor = .black
        print("User")
    }
    @objc private func lbl1Change(){
        UIView.animate(withDuration: 1.5, animations: {
            //self.lblPassword.transform = self.lblPassword.transform.scaledBy(x: 1.2 , y: 1.2)
            self.lblPassword.transform = self.lblPassword.transform.translatedBy(x: 7, y: 7)
            
            self.lblPassword.font = UIFont.boldSystemFont(ofSize: 25)
            self.lblUser.font = UIFont.boldSystemFont(ofSize: 20)
        })
        lblUser.textColor = .black
        lblPassword.textColor = .red
        print("Password")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagebg()
        view.addSubview(lblUser)
        view.addSubview(lblPassword)
        view.addSubview(txtUser)
        view.addSubview(txtPassword)
        view.addSubview(submitBtn)
        
    }
    
    func imagebg() {
        
        var imgview = UIImageView()
        imgview = UIImageView(frame: view.bounds)
        imgview.contentMode = UIView.ContentMode.scaleAspectFill
        imgview.clipsToBounds = true
        imgview.image = UIImage(named: "login1Bg")
        imgview.center = view.center
        view.addSubview(imgview)
    }
    
    override func viewDidLayoutSubviews() {
        lblUser.frame = CGRect(x: 25, y: 295, width: view.frame.width - 50, height: 30)
        txtUser.frame = CGRect(x: 25, y: 335, width: view.frame.width - 50, height: 50)
        
        lblPassword.frame = CGRect(x: 25, y: 396, width: view.frame.width - 50, height: 30)
        txtPassword.frame = CGRect(x: 25, y: 436, width: view.frame.width - 50, height: 50)
        
        submitBtn.frame = CGRect(x: 25, y: 496, width: view.frame.width - 50, height: 50)
    }
}
