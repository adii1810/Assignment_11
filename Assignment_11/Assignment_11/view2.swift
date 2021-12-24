

import UIKit

class view2: UIViewController {

    
    private let tableView = UITableView()
    var array = [Classstud]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        array = sqlHandler.shared.fetch()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        
        title = "Students"
        view.addSubview(tableView)

        self.tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        

        tableView.frame = CGRect(x: 0, y: 50, width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
    
}
extension view2: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let data = array[indexPath.row]
        cell.textLabel?.text = "\(data.Name)|\(data.Password)|\(data.Class)|\(data.Phoneno)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newpage = view4()
        newpage.name1 = array[indexPath.row]
        navigationController?.pushViewController(newpage, animated: true)

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let id = array[indexPath.row].Spid
        sqlHandler.shared.delete(for: id){ success in
            if success{
                self.array.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }else{
                print("Unable to delete")
            }
        }
    }
    
}

