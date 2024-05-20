//
//  ViewController.swift
//  AlertController
//
//  Created by Анастасия on 10.05.2024.
//

import UIKit

protocol WAlertOptionButtonDelegate: AnyObject {
    func didTap(from: UIView)
}

//MARK: - Button UIView second
class WAlertOptionButtons: UIView {
    
    
    init(frame: CGRect, title: String) {
        
        self.isHighlighted = false
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegates: WAlertOptionButtonDelegate?
    
    func setupButton() {
        
        guard let superview = self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 20
        self.backgroundColor = .systemGray
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: 60).isActive = true
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: 40).isActive = true
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    //MARK: - show bottons
    func showButtons(view: UIView) {
        self.center = view.center
        view.addSubview(self)
        setupButton()
    }


    var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.5,
                            delay: .zero,
                            options: [.curveEaseOut, .allowUserInteraction],
                           animations: {
                // тут положить дополнительные анимации при нажатии, например поменять цвет
            }, completion: nil)
        }
    }
}

//MARK: - Button UIView one
class WAlertOptionButton: UIView {
    init(frame: CGRect, title: String) {
        
        self.isHighlighted = false
        super.init(frame: frame)
        
    }
    
    weak var delegate: WAlertOptionButtonDelegate?
    
    func setupButton() {
        
        guard let superview = self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 20
        self.backgroundColor = .systemGray
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: -60).isActive = true
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: 40).isActive = true
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //MARK: - show botton
    func showButton(view: UIView) {
        self.center = view.center
        view.addSubview(self)
        setupButton()
    }
    
    
    //MARK: - metods button
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.5,
                            delay: .zero,
                            options: [.curveEaseOut, .allowUserInteraction],
                           animations: {
                // тут положить дополнительные анимации при нажатии, например поменять цвет
            }, completion: nil)
        }
    }
    
}

//MARK: - WAlert View
class WAlert: UIView {
    
    //MARK: - настройка вью(синейго квадрата)
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 250, height: 200))
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 20
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    
//MARK: - ViewController
class WViewController: UIViewController, WAlertOptionButtonDelegate {
    func didTap(from: UIView) {
        print("tap")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let alertController = WAlert(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        alertController.showAlert(onView: self.view)
        
     
        let alertOptionButton = WAlertOptionButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100), title: "sxcs")
        alertOptionButton.showButton(view: self.view)
        view.addSubview(alertOptionButton)
        alertOptionButton.delegate = self
        
        let alertButtonSecond = WAlertOptionButtons(frame: CGRect(x: 0, y: 0, width: 100, height: 50), title: "")
        alertButtonSecond.showButtons(view: view)
        view.addSubview(alertButtonSecond)
        alertButtonSecond.delegates = self
     
        
        
}
}

