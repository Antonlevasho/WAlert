//
//  ViewController.swift
//  AlertController
//
//  Created by Анастасия on 10.05.2024.
//

import UIKit

//MARK: - WAlert View
class WAlert: UIView {
    
    var title: String?
    //MARK: - настройка вью(квадрата)
    override init(frame: CGRect) {
        
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        self.title = "asdasd"
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 20
        
   
        let info = WAlertOptionButtonInfo(title: "Andnn")
        var button = WAlertOptionButton(info: info)
        
      

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    
//MARK: - ViewController
class WViewController: UIViewController {
    
    func didTap(from: UIView) {
        print("tap")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let alertController = WAlert(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        alertController.showAlert(onView: self.view)
        
      
        
        

}
}


