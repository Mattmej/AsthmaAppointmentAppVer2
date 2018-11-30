//
//  ViewController.swift
//  AsthmaAppointmentAppVer2
//
//  Created by Matt Mejia on 11/29/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit

enum AppointmentType:Int {
    case past
    case upcoming
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var currentSelection:Int = 0
    
    var people:[Appointment] = [
        Appointment(image: "user", name: "Isai", date: "27/11/2018", place: "Atlanta", specialty: "Lawyer", isUpcoming: false, hasAsthma: true),
        Appointment(image: "user", name: "Eduardo", date: "28/11/2018", place: "Atlanta", specialty: "PHP Developer", isUpcoming: true, hasAsthma: true),
        Appointment(image: "user", name: "Matt", date: "29/11/2018", place: "Atlanta", specialty: "Teacher", isUpcoming: true, hasAsthma: false),
        Appointment(image: "user", name: "Jesus", date: "30/11/2018", place: "Atlanta", specialty: "Java Developer", isUpcoming: true, hasAsthma: true),
        Appointment(image: "user", name: "Adan", date: "30/11/2018", place: "Atlanta", specialty: "iOS Developer", isUpcoming: false, hasAsthma: false)

    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        
        return cell
    }
    
    
}

