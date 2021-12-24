//
//  studentIndex.swift
//  Assignment_11
//
//  Created by DCS on 23/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class studentIndex: UIViewController {

    private let tblData = ["View Profile","Change Password","Read Notice"]
    
    private let indexTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(indexTable)
        register()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        indexTable.frame = CGRect(x: 10, y: 200, width: view.frame.width - 20, height: view.frame.height - 200)
    }
}

extension studentIndex:UITableViewDelegate,UITableViewDataSource{
    
    func register(){
        
        self.indexTable.dataSource = self
        self.indexTable.delegate = self
        self.indexTable.register(UITableViewCell.self, forCellReuseIdentifier: "data")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tblData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = indexTable.dequeueReusableCell(withIdentifier: "data", for: indexPath)
        
        cell.textLabel?.text = tblData[indexPath.row]
        cell.textLabel?.backgroundColor = .green
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(tblData[indexPath.row] == "View Profile")
        {
//            print("0")
            let vc = viewDetails()
            navigationController?.pushViewController(vc, animated: true)
                         present(vc, animated: true, completion: nil)
            
        }else if(tblData[indexPath.row] == "Change Password"){
            
            let vc = sView1()
            navigationController?.pushViewController(vc, animated: true)
            //             present(vc, animated: true, completion: nil)
            
        }else if(tblData[indexPath.row] == "Read Notice"){
            
            let vc = viewNotice()
            navigationController?.pushViewController(vc, animated: true)
            //             present(vc, animated: true, completion: nil)
            
        }
    }
    
}

