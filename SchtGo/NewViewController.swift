//
//  NewViewController.swift
//  SchtGo
//
//  Created by Brian Wang on 4/21/17.
//  Copyright © 2017 BW. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var submitSchtButton: RoundButton!
    
    @IBOutlet weak var containerView: UIView!
    
    var childController:NewSchtTableTableViewController!
    
    var mapController: MapViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.containerView.viewCon
        // Do any additional setup after loading the view.
        
        if let nav = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController,
            let pulley = nav.viewControllers.first as? SchtPulleyViewController,
            let map = pulley.mapViewController {
            mapController = map
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitScht(_ sender: Any) {
        if (childController.captionTextView.text == "Write a caption...") {
            print("empty caption")
            return
        }
        
        let caption = childController.captionTextView.text
//        let image = childController
        let dateInterval = Date().timeIntervalSince1970
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let scht = Scht(context: managedContext)
        scht.latitude = mapController.currentLocation.coordinate.latitude
        scht.longitude = mapController.currentLocation.coordinate.longitude
        scht.date = dateInterval
        scht.caption = caption
        
        do {
            try managedContext.save()
            mapController.mapView.addAnnotation(scht)
            childController.resetToPlaceholder()
        } catch let error as NSError {
            print("Could not save: \(error.localizedDescription)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NewSchtTableTableViewController {
            childController = vc
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
