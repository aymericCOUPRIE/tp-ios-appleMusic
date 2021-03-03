//
//  decoder.swift
//  tp_appli_mobile
//
//  Created by etud on 19/02/2021.
//

import Foundation

extension Bundle{
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource : file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        //charger les données
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) in bundle.")
        }
        
        print("DATA \(data)")
        
        let decoder = JSONDecoder()
        
        //T.self = le type lui même
        
        guard let loaded = try? decoder.decode(T.self, from : data) else {
            fatalError("Failed to decode \(file) in bundle.")
        }
        
        return loaded
    }

}
