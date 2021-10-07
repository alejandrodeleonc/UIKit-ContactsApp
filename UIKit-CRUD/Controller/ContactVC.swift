//
//  ContactVC.swift
//  UIKit-CRUD
//
//  Created by Alejandro De Leon on 10/7/21.
//

import UIKit

class ContactVC: UIViewController {
    
//
    var contact: Contact?
    var mainST = UIStackView()
    var imageST = UIStackView()
    var loadImageButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    var pictureInfo: [FetchedImage] = []
//    let imageView = UIImageView(image: image!)
    
    var saveButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Nuevo contacto"
        
        fetchImages()
        
    }
    
    
    func fetchImages() {
        let address = "https://jsonplaceholder.typicode.com/photos"
        
        if let url = URL(string: address){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error{
                    
                }else if let response = response as? HTTPURLResponse, let data = data {
                        print("Status Code : \(response.statusCode)")
                        do{
                            let decoder = JSONDecoder()
                            let picInfo = try decoder.decode([FetchedImage].self, from: data)
                            self.pictureInfo.append(contentsOf: picInfo)
                            
                            print("TODO BIEN")
                            self.getRadomImage()
                        }catch{
                            print("ERROR")
                            print(error)
                        }
                    }
                }.resume()
            
        }
        
    }
    
    
    func getRadomImage()
    {
        
        print("cantidad de imagines -> \(pictureInfo.count)")
        let randomInt = Int.random(in: 1..<pictureInfo.count)
//
        print("la url -> \(pictureInfo[randomInt].url)")
        
        if let url = URL(string: pictureInfo[randomInt].url){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                }else if let data = data {
                    DispatchQueue.main.async {
                        print("TOdo good")
                        print(data)
                        //UIImage(data:data)
                    }
                    

                }
            
            }.resume()
        }
    }
    

}
