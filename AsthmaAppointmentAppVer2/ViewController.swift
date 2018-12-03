//
//  ViewController.swift
//  AsthmaAppointmentAppVer2
//
//  Created by Matt Mejia on 11/29/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit



class ViewController: UIViewController, BDelegate{
    
    // This variable is connected to the index of the segmented control.
    var currentSelection:Int = 0
    
    var filteredPeople:[Appointment] = []
    
    func filterLists(appointmentHeader:AppointmentHeader, segmentIndex: Int, section:Int) -> [Appointment] {
        print("Segment Index:", segmentIndex)
        print("Section:", section)
        
        // Cases for each section
        switch section {
            
            
        // If we are in the 'upcoming' section, perform the following:
        case AppointmentType.upcoming.rawValue:
            
            // If the first segment of the segmented controller is selected, then...
            if segmentIndex == 0 {
                
                // Store the people that have asthma in the filteredPeople array.
                filteredPeople = upcomingAppointments.filter{$0.hasAsthma == true}
            }
                
            // If any other segment of the segmented controller is selected, then...
            else {
                
                // Store all people in the upcomingAppointments array into the filteredPeople array.
                filteredPeople = upcomingAppointments
            }
            
        // If we are in the 'past' section of the tableView, perform the following:
        case AppointmentType.past.rawValue:
            
            // If the first segment of the segmented controller is selected, then...
            if segmentIndex == 0 {
                
                // Store the people that have asthma in the filteredPeople array.
                filteredPeople = pastAppointments.filter{$0.hasAsthma == true}
            }
                
            // If any other segment of the segmented controller is selected, then...
            else {
                
                // Store all people in the pastAppointments array into the filteredPeople array.
                filteredPeople = pastAppointments
            }
            
        // If we aren't in either the 'upcoming' or 'past' sections, then...
        default:
            
            // filteredPeople will be an empty array.
            filteredPeople = []
        }
        
        // Sets the 'currentSelection' variable of the ViewController equal to the segment index.
        currentSelection = segmentIndex
        
        // Reload both sections of the table.
        tableView.reloadSections([0, 1], with: .fade)
        
        // Return the filteredPeople array.
        print("")
        print(filteredPeople)
        print("")
        return filteredPeople
    }
    
    @IBOutlet weak var tableView: UITableView!

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
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(UINib(nibName: "AppointmentHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "AppointmentHeader")
        
//        filteredPeople = filterLists(appointmentHeader: <#AppointmentHeader#>, segmentIndex: 0)
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
//        return 1
//        return people.count
//        return splitLists(appointmentType: AppointmentType.upcoming).count
        
        // Number of rows will differ depending on the section.
//        switch section {
//
//        // For the 'upcoming' section...
//        case AppointmentType.upcoming.rawValue:
//
//            // The number of rows will equal the number of upcoming appointments.
//            return upcomingAppointments.count
//
//        // For the 'past' section...
//        case AppointmentType.past.rawValue:
//
//            // The number of rows will equal the number of past appointments.
//            return pastAppointments.count
//
//        // If we are in neither of those sections, then...
//        default:
//
//            // The number of rows will equal the number of total appointments.
//            return allAppointments.count
//        }
        
        return filteredPeople.count
        
    }
    
    // Loop through individual cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AppointmentTableViewCell else { return UITableViewCell() }
        
//        let item = people[indexPath.row]
        
//        var item:Appointment = people[indexPath.row]
        
//        var item:Appointment = allAppointments[indexPath.row]
        var item:Appointment = filteredPeople[indexPath.row]
        
        
//        if indexPath.section == 0 {
//            item = splitLists(appointmentType: AppointmentType.upcoming)[indexPath.row]
//
//        }
//
//        else {
//            item = splitLists(appointmentType: AppointmentType.past)[indexPath.row]
//        }
        
//        switch indexPath.section {
//        case 0:
////            item = splitLists(appointmentType: AppointmentType.upcoming)[indexPath.row]
//            item = upcomingAppointments[indexPath.row]
//        case 1:
////            item = splitLists(appointmentType: AppointmentType.past)[indexPath.row]
//            item = pastAppointments[indexPath.row]
//        default:
////            item = people[indexPath.row]
//            item = allAppointments[indexPath.row]
//        }
        
        cell.setup(appointment:item)
        return cell
        

    }
    
//    // Split into upcoming and past sections
//    func splitLists(appointmentType: AppointmentType) -> [Appointment] {
////        if appointmentType == AppointmentType.upcoming {
////            return people.filter{$0.appointmentType == appointmentType}
////        }
////        else {
////            return people.filter{$0.appointmentType == }
////        }
//
//        return filteredPeople.filter{$0.appointmentType == appointmentType}
//    }
    
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
            headerCell.setup(header: "Upcoming Appointments", currentSelection: currentSelection, section: section)
//            return headerCell

        case 1:
            headerCell.setup(header: "Past Appointments", currentSelection: currentSelection, section: section)
//            return headerCell

        default:
            headerCell.setup(header: "Appointments", currentSelection: currentSelection, section: section)
//            return headerCell

        }
        
//        headerCell.setup(header: "Appointments", currentSelection: 0)
        return headerCell
        
        
    }
    
    
}

