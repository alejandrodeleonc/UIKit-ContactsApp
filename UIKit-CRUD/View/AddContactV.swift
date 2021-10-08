//
//  AddContactV.swift
//  UIKit-CRUD
//
//  Created by Alejandro De León on 7/10/21.
//

import UIKit

class AddContactV: UIView {
    //MARK: - Stacks Views
    var verticalSV  = UIStackView()
    var imageV      = UIView()
    var fieldsTV    = UITableView()
    var buttonV     = UIView()
    
    //MARK: - imageV  Components
    var pictureInfo: [FetchedImage] = []
    var imageView   = UIImageView(image: UIImage(systemName: "person"))
    var imageButton: UIButton = {

        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Cargar imagen", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        button.isEnabled = true

        return button
    }()
    
    
    
    //MARK: - buttonSV  Components
    
    let fields = ["Nombre", "Apellido", "Telefono"]
    var saveButton: UIButton = {

        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 1.00)
        button.setTitle("Guardar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true

        return button
    }()
    
    
    struct Cells {
        static let contactInfoCell = "ContactIngfoCells"
    }
    
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        configureVerticalStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   
    //MARK: - Configurations
   
    func configureVerticalStack(){
        addSubview(verticalSV)
        verticalSV.backgroundColor   = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.00)
        verticalSV.axis              = .vertical
        verticalSV.distribution      = .fillEqually
        
        setVerticalSVContraints()
        
        
        verticalSV.addArrangedSubview(imageV)
        verticalSV.addArrangedSubview(fieldsTV)
        verticalSV.addArrangedSubview(buttonV)
        
        
//        fieldsTV.backgroundColor = .black
//        buttonV.backgroundColor = .purple
        
        configureImageView()
        configureTableView()
        configureSaveButtonView()

    }
    
    func configureImageView(){

        imageV.addSubview(imageView)
        imageV.addSubview(imageButton)
        
        setImageViewContraints()
        
    }
    
    func configureSaveButtonView(){
        
        buttonV.addSubview(saveButton)
        
        configureSaveButton()
    }
    
    func configureImageButton(){
        
        imageButton.widthAnchor.constraint(equalToConstant: 200).isActive                                           = true
        imageButton.heightAnchor.constraint(equalToConstant: 30).isActive                                           = true
        imageButton.layer.cornerRadius = 15
        imageButton.clipsToBounds                                                                                   = true

        imageButton.translatesAutoresizingMaskIntoConstraints                                                       = false
        imageButton.centerXAnchor.constraint(equalTo: imageV.centerXAnchor, constant: 0).isActive                   = true
        imageButton.bottomAnchor.constraint(equalTo: imageV.bottomAnchor, constant: -25).isActive                   = true
    }
    
    func configureSaveButton(){
        
        saveButton.widthAnchor.constraint(equalToConstant: 350).isActive                                           = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive                                           = true
        saveButton.layer.cornerRadius = 10
        saveButton.clipsToBounds                                                                                   = true

        saveButton.translatesAutoresizingMaskIntoConstraints                                                       = false
        saveButton.centerXAnchor.constraint(equalTo: buttonV.centerXAnchor, constant: 0).isActive                  = true
        saveButton.centerYAnchor.constraint(equalTo: buttonV.centerYAnchor, constant: 0).isActive                  = true
        
    }
    
    
    func configureTableView(){
        
        print("configureTableView")
        
        setTableViewDelegates()
        fieldsTV.rowHeight = 75
        fieldsTV.register(ContactInfoCell.self, forCellReuseIdentifier: Cells.contactInfoCell)
//        tableView.pin(to: )
    }
    
    
    
    
    
    //MARK: - Set Constraints
    func setImageViewContraints(){
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive                                             = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.75).isActive                = true
        

        imageView.translatesAutoresizingMaskIntoConstraints                                                         = false
        
        imageView.topAnchor.constraint(equalTo: imageV.topAnchor, constant: 25).isActive                            = true
        imageView.centerXAnchor.constraint(equalTo: imageV.centerXAnchor, constant: 0).isActive                     = true
        configureImageButton()


    }

    

    func setVerticalSVContraints(){
        verticalSV.translatesAutoresizingMaskIntoConstraints                                                        = false
        verticalSV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive               = true
        verticalSV.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive       = true
        verticalSV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive                             = true
        verticalSV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive               = true
        verticalSV.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive     = true
    }
    
    func setImageSVConstraints(){

        imageV.translatesAutoresizingMaskIntoConstraints                                                            = false
        imageV.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive                                       = true
        imageV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive                               = true
        imageV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive                                 = true
        imageV.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive                                       = true
        imageV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive                             = true
    }
    
    
    //MARK: - Set Delegates
    func setTableViewDelegates(){
        fieldsTV.delegate = self
        fieldsTV.dataSource = self
    }
}






//MARK: - Table View Delegate

extension AddContactV: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.contactInfoCell) as! ContactInfoCell
        let field = fields[indexPath.row]
        cell.setLabel(text: field)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let contactVC = ContactVC()
//        contactVC.contact = contacts[indexPath.row]
//        navigationController?.navigationItem.backBarButtonItem?.title = "Cancel"
//        navigationController?.pushViewController(contactVC, animated: true)
//    }

}



//MARK: FUNCIONES

extension AddContactV{
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
