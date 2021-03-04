//
//  apiReader.swift
//  tp_appli_mobile
//
//  Created by etud on 19/02/2021.
//

import Foundation

struct ApiReader {
    
    static func readURL(url: String) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
                        
            guard let data = data else { return }
            
            do {
                let decoded = try JSONDecoder().decode(Initial.self, from: data)
                writeFile(filename: "WhereAreYou", datas: decoded.results)
            }
            catch {
                print("ERROR \(error)")
            }
        }.resume()
    }
    
    static func writeFile(filename: String, datas: [Music2]) {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            do {
                let jsonData = try JSONEncoder().encode(datas)
                //print(documentDirectory)

                let pathWithFileName = documentDirectory.appendingPathComponent("myJsonData.json")
                try jsonData.write(to: pathWithFileName, options: .atomic)
        } catch {
                print("ERROR1 \(error)")
            }
        } else {
            print("ELSE")
        }
    }
}
