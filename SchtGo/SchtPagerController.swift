//
//  SchtPagerViewController.swift
//  SchtGo
//
//  Created by Brian Wang on 4/21/17.
//  Copyright © 2017 BW. All rights reserved.
//

import UIKit
import Pager

class SchtPagerController: PagerController, PagerDataSource {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        //Setting Status Bar to be white instead of black
        UIApplication.shared.statusBarStyle = .lightContent
        
        // Instantiating Storyboard ViewControllers
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller1 = storyboard.instantiateViewController(withIdentifier: "new")
        let controller2 = storyboard.instantiateViewController(withIdentifier: "home")
        let controller3 = storyboard.instantiateViewController(withIdentifier: "history")
//
        
        self.setupPager(
            tabNames: ["", "Scht", ""],
            tabControllers: [controller2, controller1, controller3])
        
        customizeTab()
        
//        self.selectTabAtIndex(4)
    }
    
    // Customising the Tab's View
    func customizeTab() {
        indicatorColor = UIColor.black
        tabsViewBackgroundColor = UIColor.init(rgb: 0xF7F6F4, alpha: 1)
        contentViewBackgroundColor = UIColor.init(rgb: 0xF7F6F4, alpha: 1.0)
        
        
        startFromSecondTab = true
        centerCurrentTab = true
        tabLocation = PagerTabLocation.top
        tabHeight = 68
        tabOffset = 0
        tabWidth = self.view.frame.width / 3
        fixFormerTabsPositions = false
        fixLaterTabsPosition = false
        animation = PagerAnimation.during
        selectedTabTextColor = .black
        tabsTextFont = UIFont.systemFont(ofSize: 30, weight: UIFontWeightLight)
        indicatorHeight = 2
        
        
        tabTopOffset = 10.0
        tabsTextColor = UIColor.init(rgb: 0xECB438, alpha: 1)
        selectedTabTextColor = UIColor.init(rgb:0xFEC936, alpha: 1)
    }
    
    
    // Programatically selecting a tab. This function is getting called on AppDelegate
    func changeTab(index:Int) {
        self.selectTabAtIndex(index)
    }
    

}
