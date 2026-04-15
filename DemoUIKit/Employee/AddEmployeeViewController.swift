//
//  AddEmployeeViewController.swift
//  DemoUIKit
//
//  Created by Hammad Ali on 14/04/2026.
//

import UIKit

class AddEmployeeViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var IdTextField: UITextField!
    
    
    @IBOutlet weak var EmplyeeNameTextField: UITextField!
    
    
    @IBOutlet weak var EmplyeeDesiginationTextField: UITextField!
    
    
    @IBOutlet weak var EmpolyeeAddressTextField: UITextField!
    
    
    @IBOutlet weak var EmpolyeeImageView: UIImageView!
    
    // for adding temporary image
    
    var selectedImage : UIImage?
    let ImagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImagePicker.delegate = self
        EmpolyeeImageView.layer.cornerRadius = 8
        EmpolyeeImageView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    // add button for getting image from phone storage
    @IBAction func AddImageButtonTapped(_ sender: UIButton) {
        ImagePicker.sourceType = .photoLibrary
        ImagePicker.allowsEditing = true
                present(ImagePicker, animated: true)
    }
    
    // get image from gallery
    func imagePickerController(_ picker: UIImagePickerController,
                                didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage

         selectedImage = image
        DispatchQueue.main.async {
            self.EmpolyeeImageView.image = image
        }
//        EmpolyeeImageView.image = image

         dismiss(animated: true)
     }
    
    // save button for adding employee information
    @IBAction func SaveButtonTapped(_ sender: Any) {
        
        guard
                let id = IdTextField.text, !id.isEmpty,
                let name =  EmplyeeNameTextField.text, !name.isEmpty,
                let designation = EmplyeeDesiginationTextField.text, !designation.isEmpty,
                let address = EmpolyeeAddressTextField.text, !address.isEmpty,
                let image  =  selectedImage
            else {
            showalert("Please fill all fields")
            return }
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
                    print("Image conversion failed")
                    return
                }


            let employee = Employee(
                id: id,
                name: name,
                designation: designation,
                address: address,
                imageData: imageData
            )
        EmployeeModel.shared.addEmployee(employee)
        
        print("Employee Save Sucessfully")

            navigationController?.popViewController(animated: true)
    }
    
    
    // alert
    private func showalert(_ message: String){
        let alert =  UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
        
        
    }
    
}
