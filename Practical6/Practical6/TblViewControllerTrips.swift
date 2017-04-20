//
//  TblViewControllerTrips.swift
//  Practical6
//
//  Created by QANI QANIU on 20/04/2017.
//  Copyright © 2017 QANI QANIU. All rights reserved.
//

import UIKit

class TblViewControllerTrips: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.loadTrips()
        
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Utilities.trips.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath)
        cell.textLabel?.text = "\(Utilities.trips[indexPath.row].tripDestination), \(Utilities.trips[indexPath.row].tripDuration)"
        cell.detailTextLabel?.text = "\(Utilities.dateFormatter.string(from: Utilities.trips[indexPath.row].tripDate))"
        cell.imageView?.image = Utilities.trips[indexPath.row].destinationImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "segueTripDetails", sender: Utilities.trips[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueTripDetails" {
            (segue.destination as! TblViewControllerTripInfo).trip = (sender as! Trip)
        }
    }
    
    @IBAction func unWindSegue(segue : UIStoryboardSegue)
    {
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            Utilities.trips.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
