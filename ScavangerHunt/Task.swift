//
//  Task.swift
//  ScavangerHunt
//
//  Created by Carlos Sac on 9/23/25.
//


import UIKit
import CoreLocation

class Task{
    let title: String
    let description: String
    var image: UIImage?
    var imageLocation: CLLocation?
    var isComplete: Bool{
        image != nil;
    }
    init(title: String, description: String){
        self.title = title
        self.description = description
    }
    func set(_ image: UIImage, with location: CLLocation){
        self.image = image
        self.imageLocation = location
    }
}
extension Task {
    static var mockHunts: [Task] {
        return [
            Task(title: "Your favorite local restaurant 🍽️", description: "Visit and enjoy a meal at your favorite local restaurant."),
            Task(title: "Your favorite local cafe ☕️", description: "Grab a coffee or tea at your favorite local cafe."),
            Task(title: "Your favorite hiking spot 🥾", description: "Go for a hike at your favorite trail."),
            Task(title: "Your favorite local park 🌳", description: "Take a walk or relax at your favorite park."),
            Task(title: "Your favorite local museum 🏛️", description: "Explore exhibits at your favorite museum."),
            Task(title: "Your favorite local bookstore 📚", description: "Browse books at your favorite bookstore."),
            Task(title: "Your favorite local bakery 🥐", description: "Treat yourself at your favorite bakery.")
        ]
    }
}



