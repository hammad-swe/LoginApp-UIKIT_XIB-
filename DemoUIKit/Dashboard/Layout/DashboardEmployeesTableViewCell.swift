//
//  DashboardEmployeesTableViewCell.swift
//  DemoUIKit
//
//  Created by Hammad Ali on 15/04/2026.
//

import UIKit

class DashboardEmployeesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var IdShow: UILabel!
    
    @IBOutlet weak var nameShow: UILabel!
    
    
    @IBOutlet weak var desiginationShow: UILabel!
    
    @IBOutlet weak var employeeImageShow: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: Employee) {
        //self.lblName.text = model.name
        self.IdShow.text = model.id
        self.nameShow.text = model.name
        self.desiginationShow.text = model.designation
        self.employeeImageShow.image = UIImage(data: model.imageData)
       
        // circle image
        self.employeeImageShow.layer.cornerRadius = self.employeeImageShow.frame.size.width / 2
            self.employeeImageShow.clipsToBounds = true
            self.employeeImageShow.contentMode = .scaleAspectFill
    }
    
}
