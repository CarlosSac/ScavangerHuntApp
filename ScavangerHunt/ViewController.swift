//  ViewController.swift
//  ScavangerHunt
//
//  Created by Carlos Sac on 9/23/25.
//

import UIKit



class ViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    var tasks: [Task] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = UIView()
        tableView.dataSource = self
        tasks = Task.mockHunts
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // This will reload data in order to reflect any changes made to a task after returning from the detail screen.
        tableView.reloadData()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//       
//        //if statement uneccesary as there is only one possible segue
//        if segue.identifier == "MapSegue" {
//            if let mapViewController = segue.destination as? MapViewController,
//                // Get the index path for the current selected table view row.
//               let selectedIndexPath = tableView.indexPathForSelectedRow {
//
//                // Get the task associated with the slected index path
//                let task = tasks[selectedIndexPath.row]
//
//                // Set task to pass to next screen
//                mapViewController.task = task
//            }
//        }
//    }
    // swift
    // File: `ViewController.swift` (only the prepare(for:) shown)

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare(for:segue:) called. segue.identifier = \(String(describing: segue.identifier))")
        guard segue.identifier == "MapSegue" else { return }

        // handle UINavigationController wrapper if present
        let destVC: MapViewController?
        if let nav = segue.destination as? UINavigationController {
            print("Destination is a UINavigationController; topViewController = \(String(describing: nav.topViewController))")
            destVC = nav.topViewController as? MapViewController
        } else {
            print("Destination is \(type(of: segue.destination))")
            destVC = segue.destination as? MapViewController
        }

        guard let mapVC = destVC else {
            print("❌ MapSegue destination is not MapViewController")
            return
        }

        guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
            print("❌ No selected row")
            return
        }

        let taskToSend = tasks[selectedIndexPath.row]
        print("✅ Sending task to MapViewController: \(taskToSend.title)")

        mapVC.task = taskToSend
    }


}



extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesCell", for: indexPath) as? PlacesCell else {
            fatalError("Unable to dequeue Task Cell")
        }

        cell.configure(with: tasks[indexPath.row])

        return cell
    }
}






