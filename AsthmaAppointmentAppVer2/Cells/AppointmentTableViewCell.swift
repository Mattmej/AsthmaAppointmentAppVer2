//
//  AppointmentTableViewCell.swift
//  AsthmaAppointmentAppVer2
//
//  Created by Matt Mejia on 11/29/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit

class AppointmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var appointmentDateLabel: UILabel!
    @IBOutlet weak var specialtyLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(appointment:Appointment) {
        self.appointmentDateLabel.text = appointment.date
        self.nameLabel.text = appointment.name
        self.specialtyLabel.text = appointment.specialty
        self.placeLabel.text = appointment.place
        self.userImage.image = UIImage(named:appointment.image)
    }

}
