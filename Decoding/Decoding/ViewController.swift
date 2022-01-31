//
//  ViewController.swift
//  Decoding
//
//  Created by Nilesh on 30/01/22.
//

/*
 
 1. How do you decode data in iOS? JSoNDecoder/ Jsonserialization
 3. What is codable?
 4. How to decode data with custom properties?
 5. How can we decode date to date property?
 6. What is convertFromSnakeCase?
 7. How can we decode using custom decoder?
 8. How to decode same properties with different data type?
 
 
 
 
 
 */






import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        decodeData()
        // Do any additional setup after loading the view.
    }
    func decodeData() {
        do {
            if let bundlePath = Bundle.main.path(forResource: "Sample",
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                parse(jsonData: jsonData)
            }
        } catch {
            print(error)
        }
    }
    
    private func parse(jsonData: Data) {
        do {
            let formatter = DateFormatter()
            //"20:32 Wed, 30 Oct 2018"
            formatter.dateFormat = "HH:mm EEE, dd MMM y"
            let decodder = JSONDecoder()
            decodder.keyDecodingStrategy = .convertFromSnakeCase
            decodder.dateDecodingStrategy = .formatted(formatter)
            let decodedData = try decodder.decode(SampleModel.self, from: jsonData)
            
            print("Members: ", decodedData.members)
            
            print("===================================")
        } catch let error{
            print("decode error \(error.localizedDescription)")
        }
    }


}

