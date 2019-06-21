//
//  ViewController.swift
//  MLQuestionCheckDemo
//
//  Created by Michel Anderson Lutz Teixeira on 21/06/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit
import MLQuestionCheck

class ViewController: UIViewController {
    
    let questionCheck = MLQuestionCheck(question: "You are the best", checked: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(questionCheck)
        NSLayoutConstraint.activate([
            questionCheck.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionCheck.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

