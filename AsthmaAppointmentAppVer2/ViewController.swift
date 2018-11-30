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
    
    func filterLists(segmentIndex: Int) -> [Appointment] {
        print(segmentIndex)
        switch segmentIndex {
        case 0:
            filteredPeople = people.filter{$0.hasAsthma == true}
        default:
            filteredPeople = people
//        case 1:
//            filteredPeople = people.filter{$0.hasAsthma == false}
//        default:
//            filteredPeople = []
        }
        
        currentSelection = segmentIndex
        tableView.reloadSections([0, 1], with: .fade)
        return filteredPeople
    }
    
    @IBOutlet weak var tableView: UITableView!
//    var currentSelection:Int = 0
    
    var people:[Appointment] = [
        Appointment(image: "user", name: "Isai", date: "27/11/2018", place: "Atlanta", specialty: "Lawyer", appointmentType: AppointmentType.past,  hasAsthma: true),
        Appointment(image: "user", name: "Eduardo", date: "28/11/2018", place: "Atlanta", specialty: "PHP Developer", appointmentType: AppointmentType.upcoming, hasAsthma: true),
        Appointment(image: "user", name: "Matt", date: "29/11/2018", place: "Atlanta", specialty: "Teacher", appointmentType: AppointmentType.upcoming, hasAsthma: false),
        Appointment(image: "user", name: "Jesus", date: "30/11/2018", place: "Atlanta", specialty: "Java Developer", appointmentType: AppointmentType.upcoming, hasAsthma: true),
        Appointment(image: "user", name: "Adan", date: "30/11/2018", place: "Atlanta", specialty: "iOS Developer", appointmentType: AppointmentType.past, hasAsthma: false),
        Appointment(image: "user", name: "Jeff", date: "30/11/2018", place: "Atlanta", specialty: "Sailor", appointmentType: AppointmentType.upcoming, hasAsthma: true),
        Appointment(image: "user", name: "Jenna", date: "30/11/2018", place: "Atlanta", specialty: "Web Developer", appointmentType: AppointmentType.upcoming, hasAsthma: false),
        Appointment(image: "user", name: "Alex", date: "30/11/2018", place: "Atlanta", specialty: "Fisherman", appointmentType: AppointmentType.past, hasAsthma: false),
        Appointment(image: "user", name: "Laura", date: "30/11/2018", place: "Atlanta", specialty: "Singer", appointmentType: AppointmentType.past, hasAsthma: true),
        Appointment(image: "user", name: "Eric", date: "30/11/2018", place: "Atlanta", specialty: "Doctor", appointmentType: AppointmentType.past, hasAsthma: true),
        Appointment(image: "user", name: "Phil", date: "30/11/2018", place: "Atlanta", specialty: "Truck Driver", appointmentType: AppointmentType.past, hasAsthma: true)

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
        case 0:
            return splitLists(appointmentType: AppointmentType.upcoming).count
        case 1:
            return splitLists(appointmentType: AppointmentType.past).count
        default:
            return people.count
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
            headerCell.setup(header: "Upcoming Appointments", currentSelection: currentSelection)
//            return headerCell

        case 1:
            headerCell.setup(header: "Past Appointments", currentSelection: currentSelection)
//            return headerCell

        default:
            headerCell.setup(header: "Appointments", currentSelection: currentSelection)
//            return headerCell

        }
        
//        headerCell.setup(header: "Appointments", currentSelection: 0)
        return headerCell
        
        
    }
    
    
}

