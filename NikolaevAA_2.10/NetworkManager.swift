//
//  NetworkManager.swift
//  NikolaevAA_2.10
//
//  Created by Anton Nikolaev on 25.11.2021.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let link = "https://api.agify.io/?name=bella"
    var model = Model(name: "", age: 0, count: 0)
    var delegate: UpdateView?
    
    func networkRequest() {
        guard let url = URL(string: link) else { return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "not error description")
                return
            }
            do {
                self.model = try JSONDecoder().decode(Model.self, from: data)
                print(self.model)
                self.delegate?.update()
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    private init(){}
}
