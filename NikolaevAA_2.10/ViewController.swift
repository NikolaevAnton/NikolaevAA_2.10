//
//  ViewController.swift
//  NikolaevAA_2.10
//
//  Created by Anton Nikolaev on 25.11.2021.
//

import UIKit

protocol UpdateView {
    func update()
}

class ViewController: UIViewController {
    
    @IBOutlet var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.delegate = self
        NetworkManager.shared.networkRequest()
    }
}

extension ViewController: UpdateView {
    func update() {
        DispatchQueue.main.async {
            self.infoLabel.text = NetworkManager.shared.model.description
        }
    }
}

