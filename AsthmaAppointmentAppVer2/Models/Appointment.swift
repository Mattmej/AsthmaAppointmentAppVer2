//
//  Appointment.swift
//  AsthmaAppointmentAppVer2
//
//  Created by Matt Mejia on 11/29/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import Foundation

enum AppointmentType:Int {
    case past = 1
    case upcoming = 0
}

struct Appointment {
    var image: String
    var name: String
    var date: String
    var place: String
    var specialty: String
//    var isUpcoming: Bool
//    var isUpcoming: AppointmentType
//    var appointmentType: AppointmentType
    var hasAsthma: Bool
}
