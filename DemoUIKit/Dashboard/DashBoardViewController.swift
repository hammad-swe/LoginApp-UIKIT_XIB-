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
    
    // for changing edith state
    var isEditMode: Bool = false {
          didSet {
              updateNavButton()
              
              EmployeeTableView.reloadData()
          }
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dashboard"
        print("Employees:", EmployeeModel.shared.loadEmployees())
//        let emplyeeData = EmployeeModel.shared.loadEmployees()
//        self.employees = emplyeeData
        
        
        
        let nib = UINib(nibName: "DashboardEmployeesTableViewCell", bundle: nil)
        EmployeeTableView.register(nib, forCellReuseIdentifier: "DashboardEmployeesTableViewCell")
        
        EmployeeTableView.layer.cornerRadius = 15
        EmployeeTableView.layer.borderColor = UIColor.lightGray.cgColor
        
        EmployeeTableView.delegate = self
        EmployeeTableView.dataSource = self
       
        
        
        // Add button in nav bar
        setupNavBar()

                let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = addButton
        
       
        
        //        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        //        navigationItem.leftBarButtonItem = editButton
        
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        employees = EmployeeModel.shared.loadEmployees()
        EmployeeTableView.reloadData()
        
    }
    
    
    
    @objc func addTapped() {

//           let addVC = AddEmployeeViewController(nibName: "AddEmployeeViewController", bundle: nil)
//           navigationController?.pushViewController(addVC, animated: true)
               navigateToForm(employee: nil)
      
       }
    // setting edith button in navbar
    func setupNavBar() {
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                title: "Edit",
                style: .plain,
                target: self,
                action: #selector(editTapped)
            )
        }
    // toogle edith button
    @objc func editTapped() {
        
        isEditMode.toggle()
        print("Edit tapped")
    }
    
    // Update Nav Button Title
    
    func updateNavButton() {
            navigationItem.leftBarButtonItem?.title = isEditMode ? "Done" : "Edit"
    
        }
    
    // navigate when update button click
    func navigateToForm(employee: Employee?) {

        let vc = AddEmployeeViewController(nibName: "AddEmployeeViewController", bundle: nil)
        vc.employeeToEdit = employee
        navigationController?.pushViewController(vc, animated: true)
        }
    
    
  
    
}

extension DashBoardViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //  Use tableView parameter instead of direct EmployeeTableView reference
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "DashboardEmployeesTableViewCell",
            for: indexPath
        ) as? DashboardEmployeesTableViewCell else {
            fatalError("Issue with DashboardEmpolyeesTableViewCell")
        }
       

        let employee = employees[indexPath.row]
        cell.configureCell(model: employee)
        cell.editMode(isEditMode)

        // for update
        
        cell.onUpdateTapped = { [weak self] in
            guard let self = self else { return }
            self.navigateToForm(employee: employees[indexPath.row])
        }
        
        
        // for delete
        cell.onDeleteTapped = { [weak self] in
               guard let self = self else { return }
            EmployeeModel.shared.deleteEmployee(by: employee.id)
               self.employees = EmployeeModel.shared.loadEmployees()
               EmployeeTableView.deleteRows(at: [indexPath], with: .fade)
           }
        return cell
    }
    
}

