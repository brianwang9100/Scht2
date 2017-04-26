//
//  NewSchtTableTableViewController.swift
//  SchtGo
//
//  Created by Brian Wang on 4/21/17.
//  Copyright © 2017 BW. All rights reserved.
//

import UIKit

class NewSchtTableTableViewController: UITableViewController {

    @IBOutlet weak var cameraContainerView: UIView!
    
    @IBOutlet weak var captionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captionTextView.delegate = self
        captionTextView.textColor = UIColor.lightGray
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewSchtTableTableViewController.touched))
        self.tableView.addGestureRecognizer(gestureRecognizer)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    func touched() {
        captionTextView.resignFirstResponder()
    }

}

extension NewSchtTableTableViewController : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = UIColor.black
        if (textView.text == "Write a caption...") {
            captionTextView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == "") {
            resetToPlaceholder()
        }
    }
    
    func resetToPlaceholder() {
        captionTextView.text = "Write a caption..."
        captionTextView.textColor = UIColor.lightGray
    }
}

