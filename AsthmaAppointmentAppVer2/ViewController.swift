//
//  ViewController.swift
//  AsthmaAppointmentAppVer2
//
//  Created by Matt Mejia on 11/29/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit



class ViewController: UIViewController, BDelegate{
    
    var currentSelection:Int = 0
    var filteredPeople:[Appointment] = []
    
    func filterLists(appointmentHeader:AppointmentHeader, segmentIndex: Int, section:Int) -> [Appointment] {
        print(segmentIndex)
        
        switch section {
            
        // For "upcoming appointments" section
//        case 0:
//            if segmentIndex == 0 {
//                filteredPeople = people.filter{$0.hasAsthma == true}
//            }
//
//            else
            
        case AppointmentType.upcoming.rawValue:
            if segmentIndex == 0 {
                filteredPeople = upcomingAppointments.filter{$0.hasAsthma == true}
            }
            else {
                filteredPeople = upcomingAppointments
            }
            
        case AppointmentType.past.rawValue:
            if segmentIndex == 0 {
                filteredPeople = pastAppointments.filter{$0.hasAsthma == true}
            }
            else {
                filteredPeople = pastAppointments
            }
            
        default:
            filteredPeople = []
        }
        
        
        
        
        
//        switch segmentIndex {
//        case 0:
//            filteredPeople = people.filter{$0.hasAsthma == true}
//        default:
//            filteredPeople = people
//        case 1:
//            filteredPeople = people.filter{$0.hasAsthma == false}
//        default:
//            filteredPeople = []
//        }
        
        currentSelection = segmentIndex
        tableView.reloadSections([0, 1], with: .fade)
        return filteredPeople
    }
    
    @IBOutlet weak var tableView: UITableView!
//    var currentSelection:Int = 0

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
        
//        tableView.register(UINib(nibName: "AppointmentHeader", bundle: nil), forCellReuseIdentifier: "AppointmentHeader")
        tableView.register(UINib(nibName: "AppointmentHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "AppointmentHeader")
        
        filteredPeople = filterLists(segmentIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func filterLists(currentList: AppointmentType) -> [Appointment]


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//        return people.count
//        return splitLists(appointmentType: AppointmentType.upcoming).count
        
        switch section {
        case AppointmentType.upcoming.rawValue:
            return splitLists(appointmentType: AppointmentType.upcoming).count
        case AppointmentType.past.rawValue:
            return splitLists(appointmentType: AppointmentType.past).count
        default:
//            return people.count
            return allAppointments.count
        }
        
    }
    
    // Loop through individual cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AppointmentTableViewCell else { return UITableViewCell() }
        
//        let item = people[indexPath.row]
        
        var item:Appointment = people[indexPath.row]
        
        
//        if indexPath.section == 0 {
//            item = splitLists(appointmentType: AppointmentType.upcoming)[indexPath.row]
//
//        }
//
//        else {
//            item = splitLists(appointmentType: AppointmentType.past)[indexPath.row]
//        }
        
        switch indexPath.section {
        case 0:
            item = splitLists(appointmentType: AppointmentType.upcoming)[indexPath.row]
        case 1:
            item = splitLists(appointmentType: AppointmentType.past)[indexPath.row]
        default:
            item = people[indexPath.row]
        }
        
        cell.setup(appointment:item)
        return cell
        

    }
    
    // Split into upcoming and past sections
    func splitLists(appointmentType: AppointmentType) -> [Appointment] {
//        if appointmentType == AppointmentType.upcoming {
//            return people.filter{$0.appointmentType == appointmentType}
//        }
//        else {
//            return people.filter{$0.appointmentType == }
//        }
        
        return filteredPeople.filter{$0.appointmentType == appointmentType}
    }
    
    // Display header cell
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "AppointmentHeader") as? AppointmentHeader else { return UITableViewCell() }
        
        headerCell.delegate = self
        
        headerCell.backgroundView = UIView(frame: headerCell.bounds)
        headerCell.backgroundView?.backgroundColor = UIColor.cyan
        
        switch section {
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

