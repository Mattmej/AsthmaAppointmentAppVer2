//
//  AppointmentHeader.swift
//  AsthmaAppointmentAppVer2
//
//  Created by Matt Mejia on 11/29/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit

protocol BDelegate {
    
    // Accepts parameters for appointmentHeader, segment index, and table section
    func filterLists(appointmentHeader:AppointmentHeader, segmentIndex:Int, section:Int) -> [Appointment]
//    func splitLists(isUpcoming:Bool) -> [Appointment]
}

class AppointmentHeader: UITableViewHeaderFooterView {
    
    var delegate:BDelegate?
    
    // This variable is connected to the sections of the table view.
    var section:Int = 0
    
    // This variable is connected to the index of the segmented control.
    var currentSelection:Int = 0
    
    // View Elements
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // If the segmented control's value changes (if user selects a different segment)
    @IBAction func segmentValueChanged(_ sender: Any) {
        
        // The delegate runs the "filterLists" function
        // Accepts parameters for appointmentHeader, segment index, and table section
        delegate?.filterLists(appointmentHeader:self, segmentIndex: segmentedControl.selectedSegmentIndex, section: section)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Function to setup the header cell.
    // Accepts parameters for header title, index of the selected segmented control, and section of the table view.
    func setup(header:String, currentSelection:Int, section:Int) {
        
        // Set the text of the top label to the 'header' parameter
        self.topLabel.text = header
        
        // Set the header's segmented control index variable to the 'currentSelection' parameter
        self.currentSelection = currentSelection
        
        // Sets the segmented control's index to the 'currentSelection' parameter
        segmentedControl.selectedSegmentIndex = currentSelection
        
        // Sets the header's section to the 'section' parameter.
        self.section = section

        

        
    }
    

}
