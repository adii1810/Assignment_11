//
//  addNotice.swift
//  Assignment_11
//
//  Created by DCS on 20/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class addNotice: UIViewController {

    var name1:Noticeclass?
    
    private let Date = UIDatePicker()
    
    private let noticeDate:UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .lightGray
        txt.placeholder = "Date"
        txt.textAlignment = .center
        return txt
    }()
    
    private let noticeTitle:UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .lightGray
        txt.placeholder = "Title"
        txt.textAlignment = .center
        return txt
    }()
    
    private let notice:UITextView = {
        let txt = UITextView()
        txt.backgroundColor = .lightGray
        txt.textColor = .gray
        txt.text = "Add Notice"
        txt.font = UIFont.systemFont(ofSize: 20)
        txt.textAlignment = .center
        return txt
    }()
    
    
    
    private let button:UIButton = {
        let btn = UIButton()
        btn.setTitle("Post Notice", for: .normal)
        btn.addTarget(self, action: #selector(saveStud), for: .touchUpInside)
        btn.backgroundColor = .green
        return btn
    }()
    
    func createDate(){
        Date.datePickerMode = .date
        noticeDate.inputView = Date
        noticeDate.inputAccessoryView = createToolbar()
        
    }
    func createToolbar()->UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePress))
        toolbar.setItems([doneBtn], animated: true)
        return toolbar
    }
    
    @objc private func donePress(){
        let format = DateFormatter()
        format.dateStyle = .medium
        format.timeStyle = .none
        
        self.noticeDate.text = format.string(from: Date.date)
        self.view.endEditing(true)
    }
    
    @objc private func saveStud(){
        let Date = noticeDate.text!
        let title = noticeTitle.text!
        let nBody = notice.text!
        
                if let not = name1{
                    let updatenot = Noticeclass(id: not.id, title: title, notice: nBody, date: Date)
                    print("Update\(updatenot)")
                    update(notc: updatenot)
                }
                else{
        print("Insert \(Date),\(title),\(nBody)")
        let insert1 = Noticeclass(id: name1?.id ?? 0, title: title, notice: nBody, date: Date)
        insert(notc: insert1)
             }
        
        if notice.textColor == UIColor.black{
            notice.text = "Add Notice"
            notice.textColor = .gray
        }
        
    }
    
    private func insert(notc: Noticeclass){
        sqlHandler.shared.noticeInsert(notc: notc){ success in
            if success{
                print("insert successfull")
                self.reset()
            }
            else {
                print("insert Unsuccessfull")
            }
            
        }
    }
    private func update(notc: Noticeclass){
        sqlHandler.shared.noticeUpdate(notc: notc){ success in
            if success{
                print("Update successfull")
                self.reset()
            }
            else {
                print("Update Unsuccessfull")
            }
            
        }
    }
    
    private func reset(){
        name1 = nil
        noticeDate.text = ""
        noticeTitle.text = ""
        notice.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.notice.delegate = self
        view.addSubview(noticeDate)
        view.addSubview(noticeTitle)
        view.addSubview(notice)
        view.addSubview(button)
        createDate()
        
        if let data = name1{
            notice.textColor = .black
            noticeTitle.text = data.title
            notice.text = data.notice
            noticeDate.text = data.date
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        noticeDate.frame = CGRect(x: 10, y: 70, width: view.frame.width - 20, height: 40)
        noticeTitle.frame = CGRect(x: 10, y: 120, width: view.frame.width - 20, height: 40)
        notice.frame = CGRect(x: 10, y: 170, width: view.frame.width - 20, height: 100)
        button.frame = CGRect(x: 10, y: 400, width: view.frame.width - 20, height: 40)
    }
}
extension addNotice:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if notice.textColor == UIColor.gray && notice.text == "Add Notice"{
            notice.text = nil
            notice.textColor = .black
        }
    }
    
    	
}

