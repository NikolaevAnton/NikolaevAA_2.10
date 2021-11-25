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
    
    func networkRequest() -> Model {
        var model = Model(name: "", age: 0, count: 0)
        guard let url = URL(string: link) else { return model}
        
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    print(error?.localizedDescription ?? "not error description")
                    return
                }
                do {
                        let modelDecoder = try JSONDecoder().decode(Model.self, from: data)
                        model = modelDecoder
                        print("JSONDecoder() \(model.description)")
                } catch let error {
                    print(error.localizedDescription)
                }
            }.resume()
        }
        
        print("networkRequest \(model.description)")
        return model
    }
    
    private init(){}
}
