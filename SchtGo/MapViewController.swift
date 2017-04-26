//
//  ViewController.swift
//  SchtGo
//
//  Created by Brian Wang on 4/21/17.
//  Copyright © 2017 BW. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    var currentLocation: CLLocation!
    var first = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadAnnotations()
    }
    
    func loadAnnotations() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("Error! AppDelegate does not exist")
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Scht> = Scht.fetchRequest()
        
        do {
            let pins = try managedContext.fetch(fetchRequest)
            //clear all
            mapView.removeAnnotations(mapView.annotations)
            //readd all
            mapView.addAnnotations(pins)
        } catch let error as NSError {
            print("Could not fetch: \(error.localizedDescription)")
        }

    }

}

extension MapViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            currentLocation = location
            
            let region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.025, 0.025))
            if (first) {
                mapView.setRegion(region, animated: false)
                first = false
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

extension MapViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        if annotation is MKUserLocation {
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
//            annotationView!.isEnabled = true
        } else {
            annotationView!.annotation = annotation
        }
        let image = resizeImage(image: UIImage(named: "Scht")!, newWidth: 40.0)
        annotationView!.image = image
        return annotationView
    }
    
    
}
