//
//  DashBoardViewController.swift
//  DemoUIKit
//
//  Created by Hammad Ali on 12/04/2026.
//

import UIKit

class DashBoardViewController: UIViewController{
    
   
    @IBOutlet weak var EmployeeTableView: UITableView!
   // let name = ["Hamad", "Ali", "Wajahat"]
    var employees: [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dashboard"
        print("Employees:", EmployeeModel.shared.loadEmployees())
//        let emplyeeData = EmployeeModel.shared.loadEmployees()
//        self.employees = emplyeeData
        
        let nib = UINib(nibName: "DashboardEmployeesTableViewCell", bundle: nil)
        EmployeeTableView.register(nib, forCellReuseIdentifier: "DashboardEmployeesTableViewCell")
        
        
        EmployeeTableView.delegate = self
        EmployeeTableView.dataSource = self
       
        
        
        // Add button in nav bar

                let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

                navigationItem.rightBarButtonItem = addButton
        
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        employees = EmployeeModel.shared.loadEmployees()
        EmployeeTableView.reloadData()
        
    }
    
    @objc func addTapped() {

           let addVC = AddEmployeeViewController(nibName: "AddEmployeeViewController", bundle: nil)
           navigationController?.pushViewController(addVC, animated: true)

       }
  
    
}

extension DashBoardViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // ✅ Use tableView parameter instead of direct EmployeeTableView reference
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "DashboardEmployeesTableViewCell",
            for: indexPath
        ) as? DashboardEmployeesTableViewCell else {
            fatalError("Issue with DashboardEmpolyeesTableViewCell")
        }
       

        let employee = employees[indexPath.row]
        cell.configureCell(model: employee)
        return cell
    }
    
}

