//
//  FalseViewController.swift
//  DonaldDump
//
//  Created by Kenneth Aguilar on 8/22/20.
//  Copyright © 2020 AWSStudent. All rights reserved.
//

import UIKit

class FalseViewController: UIViewController {
    var falseView = FalseView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        view = falseView
    }
}
