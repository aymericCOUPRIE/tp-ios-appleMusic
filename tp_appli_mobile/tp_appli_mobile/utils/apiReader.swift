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
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                
                //print(json)
                
                guard let json1 = json else { return }
                writeFile(filename: "WhereAreYou", datas: json1)
            }
            catch {
            }
            
            
            
        }.resume()
    }
    
    static func writeFile(filename: String, datas: [String: Any]) {
        
        print(datas["results"]!)
        guard let data: String = datas["results"] as! String? else { return }
        
            if let jsonData = data.data(using: .utf8),
                let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                                 in: .userDomainMask).first {
                let pathWithFileName = documentDirectory.appendingPathComponent(filename)
                
                print("AFTER PATHWITHFILENAME")
                
                do {
                    try jsonData.write(to: pathWithFileName)
                } catch {
                    print("ERROR \(error)")
                }
                
                print("HELLO")
            }
        }
    }
