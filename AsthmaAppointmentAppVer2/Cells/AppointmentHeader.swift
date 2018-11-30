//
//  AppointmentHeader.swift
//  AsthmaAppointmentAppVer2
//
//  Created by Matt Mejia on 11/29/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit

protocol BDelegate {
    func filterLists(appointmentHeader:AppointmentHeader, segmentIndex:Int, section:Int) -> [Appointment]
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
    
    var delegate:BDelegate?
    var section:Int = 0
    var currentSelection:Int = 0
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        delegate?.filterLists(appointmentHeader:self, segmentIndex: segmentedControl.selectedSegmentIndex)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(header:String, currentSelection:Int, section:Int) {
        self.topLabel.text = header
        self.currentSelection = currentSelection
        segmentedControl.selectedSegmentIndex = currentSelection
        self.section = section

        

        
    }
    

}
