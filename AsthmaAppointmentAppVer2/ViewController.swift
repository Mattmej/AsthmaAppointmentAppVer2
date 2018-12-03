//
//  ViewController.swift
//  AsthmaAppointmentAppVer2
//
//  Created by Matt Mejia on 11/29/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit



class ViewController: UIViewController, BDelegate{
    
    var allAppointments:[Appointment] = [
        Appointment(image: "person1", name: "Isai", date: "27/11/2018", place: "Atlanta", specialty: "Lawyer", hasAsthma: true),
        Appointment(image: "person4", name: "Eduardo", date: "28/11/2018", place: "Atlanta", specialty: "PHP Developer", hasAsthma: true),
        Appointment(image: "person5", name: "Matt", date: "29/11/2018", place: "Atlanta", specialty: "Teacher", hasAsthma: false),
        Appointment(image: "person6", name: "Jesus", date: "30/11/2018", place: "Atlanta", specialty: "Java Developer", hasAsthma: true),
        Appointment(image: "person7", name: "Adan", date: "30/11/2018", place: "Atlanta", specialty: "iOS Developer", hasAsthma: false),
        Appointment(image: "person8", name: "Jeff", date: "30/11/2018", place: "Atlanta", specialty: "Sailor", hasAsthma: true),
        Appointment(image: "person2", name: "Jenna", date: "30/11/2018", place: "Atlanta", specialty: "Web Developer", hasAsthma: false),
        Appointment(image: "person9", name: "Alex", date: "30/11/2018", place: "Atlanta", specialty: "Fisherman", hasAsthma: false),
        Appointment(image: "person3", name: "Laura", date: "30/11/2018", place: "Atlanta", specialty: "Singer", hasAsthma: true),
        Appointment(image: "person10", name: "Eric", date: "30/11/2018", place: "Atlanta", specialty: "Doctor", hasAsthma: true),
        Appointment(image: "person11", name: "Phil", date: "30/11/2018", place: "Atlanta", specialty: "Truck Driver", hasAsthma: true)
    ]
    
    var upcomingAppointments:[Appointment] = [
        Appointment(image: "person4", name: "Eduardo", date: "28/11/2018", place: "Atlanta", specialty: "PHP Developer", hasAsthma: true),
        Appointment(image: "person5", name: "Matt", date: "29/11/2018", place: "Atlanta", specialty: "Teacher", hasAsthma: false),
        Appointment(image: "person6", name: "Jesus", date: "30/11/2018", place: "Atlanta", specialty: "Java Developer", hasAsthma: true),
        Appointment(image: "person7", name: "Adan", date: "30/11/2018", place: "Atlanta", specialty: "iOS Developer", hasAsthma: false),
        Appointment(image: "person8", name: "Jeff", date: "30/11/2018", place: "Atlanta", specialty: "Sailor", hasAsthma: true),
        Appointment(image: "person2", name: "Jenna", date: "30/11/2018", place: "Atlanta", specialty: "Web Developer", hasAsthma: false)
    ]
    
    var pastAppointments:[Appointment] = [
        Appointment(image: "person1", name: "Isai", date: "27/11/2018", place: "Atlanta", specialty: "Lawyer",  hasAsthma: true),
        Appointment(image: "person7", name: "Adan", date: "30/11/2018", place: "Atlanta", specialty: "iOS Developer", hasAsthma: false),
        Appointment(image: "person9", name: "Alex", date: "30/11/2018", place: "Atlanta", specialty: "Fisherman", hasAsthma: false),
        Appointment(image: "person3", name: "Laura", date: "30/11/2018", place: "Atlanta", specialty: "Singer", hasAsthma: true),
        Appointment(image: "person10", name: "Eric", date: "30/11/2018", place: "Atlanta", specialty: "Doctor", hasAsthma: true),
        Appointment(image: "person11", name: "Phil", date: "30/11/2018", place: "Atlanta", specialty: "Truck Driver", hasAsthma: true)
    ]
    
    // This variable is connected to the index of the segmented control.
    var currentSelectionUpcoming:Int = 0
    var currentSelectionPast:Int = 0
    

    var filteredUpcoming:[Appointment] = []
    var filteredPast:[Appointment] = []
    
    func filterLists(appointmentHeader:AppointmentHeader, segmentIndex: Int, section:Int) {
        print("Segment Index:", segmentIndex)
        print("Section:", section)
        
        // Cases for each section
        switch section {
            
            
        // If we are in the 'upcoming' section, perform the following:
        case AppointmentType.upcoming.rawValue:
            
            // If the first segment of the segmented controller is selected, then...
            if segmentIndex == 0 {
                
                // Store the people that have asthma in the filteredUpcoming array.
                filteredUpcoming = upcomingAppointments.filter{$0.hasAsthma == true}
            }
                
            // If any other segment of the segmented controller is selected, then...
            else {
                
                // Store all people in the upcomingAppointments array into the filteredUpcoming array.
                filteredUpcoming = upcomingAppointments
            }
            
            currentSelectionUpcoming = segmentIndex
            
        // If we are in the 'past' section of the tableView, perform the following:
        case AppointmentType.past.rawValue:
            
            // If the first segment of the segmented controller is selected, then...
            if segmentIndex == 0 {
                
                // Store the people that have asthma in the filteredUpcoming array.
                filteredPast = pastAppointments.filter{$0.hasAsthma == true}
            }
                
            // If any other segment of the segmented controller is selected, then...
            else {
                
                // Store all people in the pastAppointments array into the filteredUpcoming array.
                filteredPast = pastAppointments
            }
            
            currentSelectionPast = segmentIndex
            
        // If we aren't in either the 'upcoming' or 'past' sections, then...
        default:
            
            // filteredUpcoming will be an empty array.
            filteredUpcoming = []
            filteredPast = []
        }
        
        // Reload a section of the table.
        tableView.reloadSections([section], with: .fade)
        //tableView.reloadSections([0,1], with: .fade)
        
        // Return the filteredUpcoming array.
        print("")
        print(filteredUpcoming)
        print("")
    }
    
    @IBOutlet weak var tableView: UITableView!

    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(UINib(nibName: "AppointmentHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "AppointmentHeader")

        
        filteredUpcoming = upcomingAppointments.filter{$0.hasAsthma == true}
        filteredPast = pastAppointments.filter{$0.hasAsthma == true}
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



/*******************************************************************************************/




// Setting up the tableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Number of sections in tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Number of rows for each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return filteredUpcoming.count
        case 1:
            return filteredPast.count
        default:
            return allAppointments.count
        }
        
    }
    
    // Loop through individual cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AppointmentTableViewCell else { return UITableViewCell() }
        
        var item:Appointment?
        
        
        switch indexPath.section {
        case 0:
            item = filteredUpcoming[indexPath.row]
        case 1:
            item = filteredPast[indexPath.row]
        default:
            item = allAppointments[indexPath.row]
        }
        
        cell.setup(appointment:item!)
        return cell
        

    }
    

    
    // Display header cell
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "AppointmentHeader") as? AppointmentHeader else { return UITableViewCell() }
        
        headerCell.delegate = self
        
        headerCell.backgroundView = UIView(frame: headerCell.bounds)
        headerCell.backgroundView?.backgroundColor = UIColor.cyan
        
        // Sets up the headerCell differently depending on each tableView section
        switch section {
            
        // For the 'upcoming appointments' section of the tableView...
        case 0:
            headerCell.setup(header: "Upcoming Appointments", currentSelection: currentSelectionUpcoming, section: section)

        case 1:
            headerCell.setup(header: "Past Appointments", currentSelection: currentSelectionPast, section: section)

        default:
            headerCell.setup(header: "Appointments", currentSelection: currentSelectionUpcoming, section: section)

        }
        
        return headerCell
        
        
    }
    
    
}

