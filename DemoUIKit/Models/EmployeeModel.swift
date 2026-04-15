//
//  EmployeeModel.swift
//  DemoUIKit
//
//  Created by Hammad Ali on 14/04/2026.
//

import Foundation

struct Employee : Codable {
    var id: String
        var name: String
        var designation: String
        var address: String
   var imageData: Data
}

class EmployeeModel {
    
    static let shared = EmployeeModel() // Singleton
    
      private init() {}
    
    private let key = "employee"
    
    // Save Employee
    func saveEmployees(_ employees: [Employee]) {
            if let encoded = try? JSONEncoder().encode(employees) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    
    // show employee or show
    func loadEmployees() -> [Employee] {
            if let data = UserDefaults.standard.data(forKey: key),
               let decoded = try? JSONDecoder().decode([Employee].self, from: data) {
                return decoded
            }
            return []
        }
    
    // save employee function
    func addEmployee(_ employee: Employee) {
            var employees = loadEmployees()
            employees.append(employee)
            saveEmployees(employees)
        }
    
    // Update employee
    
    func updateEmployee(_ updatedEmployee: Employee) {
           var employees = loadEmployees()
           if let index = employees.firstIndex(where: { $0.id == updatedEmployee.id }) {
               employees[index] = updatedEmployee
               saveEmployees(employees)
           }
       }
       
    // get employee
    
    func getEmployee(by id: String) -> Employee? {
            return loadEmployees().first { $0.id == id }
        }
    
    // delete employee
    
    func deleteEmployee(by id: String) {
            var employees = loadEmployees()
            employees.removeAll { $0.id == id }
            saveEmployees(employees)
        }
    
    // clear employee
    
    func clearAll() {
           UserDefaults.standard.removeObject(forKey: key)
       }
}
