//
//  DetailVC.swift
//  TableView-Sean
//
//  Created by Bilgihan Köse on 19.05.2020.
//  Copyright © 2020 Bilgihan Kose. All rights reserved.
//

import UIKit



class DetailVC: UIViewController {

   var window: UIWindow?

    override func viewDidLoad() {
        super.viewDidLoad()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        view.backgroundColor = .white
        }
    
}
