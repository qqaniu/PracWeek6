//
//  TblViewControllerTripInfo.swift
//  Practical6
//
//  Created by QANI QANIU on 20/04/2017.
//  Copyright © 2017 QANI QANIU. All rights reserved.
//

import UIKit

class TblViewControllerTripInfo: UITableViewController {

    var trip : Trip?
    
    @IBOutlet weak var tripDate: UITextField!
    @IBOutlet weak var tripDuration: UITextField!
    @IBOutlet weak var tripDestination: UITextField!
    
    @IBAction func saveTripInfo(_ sender: Any) {
        trip!.tripDate = Utilities.dateFormatter.date(from: tripDate.text!)!
        trip!.tripDuration = Int(tripDuration.text!)!
        trip!.tripDestination = tripDestination.text!
    }

    override func viewWillAppear(_ animated: Bool) {
        if trip != nil {
            tripDate.text = Utilities.dateFormatter.string(for: trip!.tripDate)
            tripDestination.text = trip!.tripDestination
            tripDuration.text = "\(trip!.tripDuration)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
