//
//  indexView.swift
//  Student
//
//  Created by Mymac on 17/12/21.
//  Copyright © 2021 Mymac. All rights reserved.
//

import UIKit

class indexView: UIViewController {

    private let tblData = ["ADD NEW STUDENT","FETCH ALL STUDENTS","FETCH STUDENT DATA FROM \n SPECIFIC CLASS","MODIFY EXISTING STUDENT DETAILS","REMOVE STUDENT","UPDATE NOTICEBOARD"]
    
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

extension indexView:UITableViewDelegate,UITableViewDataSource{
    
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
        
        if(tblData[indexPath.row] == "ADD NEW STUDENT")
        {
            print("0")
            let vc = view1()
            navigationController?.pushViewController(vc, animated: true)
//             present(vc, animated: true, completion: nil)
            
        }else if(tblData[indexPath.row] == "FETCH ALL STUDENTS"){
            
            let vc = view2()
            navigationController?.pushViewController(vc, animated: true)
//             present(vc, animated: true, completion: nil)
            
        }else if(tblData[indexPath.row] == "FETCH STUDENT DATA FROM \n SPECIFIC CLASS"){
            
            let vc = view3()
            navigationController?.pushViewController(vc, animated: true)
//             present(vc, animated: true, completion: nil)
            
        }else if(tblData[indexPath.row] == "MODIFY EXISTING STUDENT DETAILS"){
            
            let vc = view2()
            navigationController?.pushViewController(vc, animated: true)
            
        }else if(tblData[indexPath.row] == "REMOVE STUDENT"){
            
            let vc = view2()
            navigationController?.pushViewController(vc, animated: true)
            
        }else if(tblData[indexPath.row] == "UPDATE NOTICEBOARD"){
            
            let vc = view5()
            navigationController?.pushViewController(vc, animated: true)
        }
    
    }
    
}
