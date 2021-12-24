//
//  viewNotice.swift
//  Assignment_11
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class viewNotice: UIViewController {

    var notcc = [Noticeclass]()
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(noticeDate)
        view.addSubview(noticeTitle)
        view.addSubview(notice)
        notcc = sqlHandler.shared.currNotice()
        noticeDate.text = notcc[0].date
        noticeTitle.text = notcc[0].title
        notice.text = notcc[0].notice
    
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        noticeDate.frame = CGRect(x: 10, y: 70, width: view.frame.width - 20, height: 40)
        noticeTitle.frame = CGRect(x: 10, y: 120, width: view.frame.width - 20, height: 40)
        notice.frame = CGRect(x: 10, y: 170, width: view.frame.width - 20, height: 100)
    }
    
}
