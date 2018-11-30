//
//  AppointmentHeader.swift
//  AsthmaAppointmentAppVer2
//
//  Created by Matt Mejia on 11/29/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit

protocol BDelegate {
    func filterLists(hasAsthma:Bool) -> [Appointment]
//    func splitLists(isUpcoming:Bool) -> [Appointment]
}

class AppointmentHeader: UITableViewHeaderFooterView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentValueChanged(_ sender: Any) {
    }
    

}
