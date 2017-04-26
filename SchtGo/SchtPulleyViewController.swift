//
//  SchtPulleyViewController.swift
//  SchtGo
//
//  Created by Brian Wang on 4/21/17.
//  Copyright © 2017 BW. All rights reserved.
//

import UIKit
import Pulley

class SchtPulleyViewController: PulleyViewController {
    
    var mapViewController:MapViewController!
    var pagerViewController:SchtPagerController!

    override func viewDidLoad() {
        super.viewDidLoad()
//        drawerBackgroundVisualEffectView = UIVisualEffectView(effect: UIBlurEffect())
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func customizeDrawer() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "background" {
            mapViewController = segue.destination as! MapViewController
        } else if segue.identifier == "foreground" {
            pagerViewController = segue.destination as! SchtPagerController
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
