//
//  ViewController.swift
//  NikolaevAA_2.10
//
//  Created by Anton Nikolaev on 25.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let link = "https://api.agify.io/?name=bella"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: link) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "not error description")
                return
            }
            do {
                let model = try JSONDecoder().decode(Model.self, from: data)
                print(model.description)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }


}

