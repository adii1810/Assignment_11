//
//  view3.swift
//  Student
//
//  Created by Mymac on 18/12/21.
//  Copyright © 2021 Mymac. All rights reserved.
//

import UIKit

class view3: UIViewController {

    private let tableView = UITableView()
    private var Classss:String?
    var array = [Classstud]()
    
    let searchBar = UISearchBar()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        array = sqlHandler.shared.fetch(sClass: Classss ?? "0")
        tableView.reloadData()
    }
    
    //    private let tool:UIToolbar = {
    //        let t = UIToolbar()"
    //        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNotes))
    //        let s = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil )
    //        t.items = [s,add]
    //        return t
    //    }()
    
    //    @objc private func addNotes(){
    //        let newpage = Page2ViewController()
    //        navigationController?.pushViewController(newpage, animated: true)
    //        //self.present(newpage, animated: true, completion: nil)
    //    }
    //
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let temp = sqlHandler.shared
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search))
        searchBar.sizeToFit()
        //title = "Students3"
        view.addSubview(tableView)
        //        view.addSubview(tool)
        self.tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    @objc private func search(){
        navigationItem.titleView = searchBar
        searchBar.showsCancelButton = true
        navigationItem.rightBarButtonItem = nil
        searchBar.becomeFirstResponder()
        searchBar.delegate = self
         print(searchBar.text)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //        tool.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: 50)
        tableView.frame = CGRect(x: 0, y: 50, width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
    
}
extension view3: UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let data = array[indexPath.row]
        cell.textLabel?.text = "\(data.Name)|\(data.Password)|\(data.Class)|\(data.Phoneno)"
        //        cell.setcell(title: array[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("hello")
        navigationItem.titleView = nil
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search))
        searchBar.showsCancelButton = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       Classss = searchBar.text
        print(Classss!)
        array = sqlHandler.shared.fetch(sClass: Classss ?? "0")
        tableView.reloadData()
    }
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        let newpage = Page2ViewController()
    //        newpage.name1 = array[indexPath.row]
    //        navigationController?.pushViewController(newpage, animated: true)
    //        //self.present(newpage, animated: true, completion: nil)
    //
    //    }
    //
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        let id = array[indexPath.row].id
    //        SqliteHandler.shared.delete(for: id){ success in
    //            if success{
    //                self.array.remove(at: indexPath.row)
    //                tableView.deleteRows(at: [indexPath], with: .automatic)
    //            }else{
    //                print("Unable to delete")
    //            }
    //        }
    //    }
    
}


