//
//  ViewController.swift
//  DonaldDump
//
//  Created by Lorena Macias on 8/19/20.
//  Copyright © 2020 AWSStudent. All rights reserved.
//

import UIKit

class TrueFalseViewController: UIViewController {
    var trueFalseView = TrueFalseView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        view = trueFalseView
        trueFalseView.configure(content: TrueFalseView.Content(tweetLabel: "pizza"))
        trueFalseView.delegate = self
    }
}

extension TrueFalseViewController: TrueFalseDelegate {
    func didTapTrueButton() {
        print("true")
    }
    
    func didTapFalseButton() {
        print("false")
    }
}
