//
//  ImagePickerVC.swift
//  UIKit-CRUD
//
//  Created by Alejandro De Leon on 10/7/21.
//

import UIKit

class SecondViewController: UIViewController {

    //MARK: - Properties
       
       let secondView = SecondView()
       var pictureInfo = [FetchedImage]() {
           didSet{
               DispatchQueue.main.async {
                   self.secondView.myCollectionView.reloadData()
                   print(self.pictureInfo[0].url)
               }
           }
       }
       
       //MARK: - Life Cycle
       
       override func viewDidLoad() {
           super.viewDidLoad()
           view = secondView
           secondView.myCollectionView.dataSource = self
           secondView.myCollectionView.delegate = self
           fetchImages()
           setNavBtn()
       }
       
       //MARK: - Functions
       
       func setNavBtn() {
           navigationItem.rightBarButtonItem = UIBarButtonItem(customView: secondView.addBtn)
           secondView.addBtn.addTarget(self, action: #selector(addImages), for: .touchUpInside)
       }
       
       @objc func addImages() {
           DispatchQueue.main.async {
               self.fetchImages()
           }
           
       }
       
       func fetchImages() {
           let address = "https://jsonplaceholder.typicode.com/photos"
           if let url = URL(string: address) {
               URLSession.shared.dataTask(with: url) { (data, response, error) in
                   if let error = error {
                       print("Error: \(error)")
                   }else if let response = response as? HTTPURLResponse, let data = data {
                       print("Status Code: \(response.statusCode)")
                       do{
                           let decoder = JSONDecoder()
                           let picInfo = try decoder.decode([FetchedImage].self, from: data)
                           self.pictureInfo.append(contentsOf: picInfo)
                       }catch{
                           print(error)
                       }
                   }
               }.resume()
           }
           
       }

   }

   //MARK: - UICollectionViewDelegate, UICollectionViewDataSource
   extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource {
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           pictureInfo.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.collectionViewId, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
           
           DispatchQueue.main.async {
               cell.myImageView.loadImages(from: URL(string: self.pictureInfo[indexPath.row].url) as! URL)
           }
           
           return cell
       }
       
       
   }

