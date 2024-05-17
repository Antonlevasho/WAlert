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
class WAlertOptionButton: UIView {
    
    
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

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animateToActiveState()
    }

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouch(touches, touchEnded: false)
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouch(touches, touchEnded: true)
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        animateToDefaultState()
    }

    func handleTouch(_ touches: Set<UITouch>, touchEnded: Bool) {
        if let touchLocationInSuperview: CGPoint = touches.first?.location(in: self.superview) {
            let touchLocation: CGPoint = self.convert(touchLocationInSuperview, to: self)
            if frame.contains(touchLocation) {
                if touchEnded {
                    animateToDefaultState()
                    delegates?.didTap(from: self)
                } else {
                    animateToActiveState()
                }
            } else {
                animateToDefaultState()
            }
        } else {
            animateToDefaultState()
        }
    }

    func animateToActiveState() {
        isHighlighted = true
    }

    func animateToDefaultState() {
        isHighlighted = false
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
class WAlertOptionButtonCustom: UIView {
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
    
    //NARK: - show botton
    func showButton(view: UIView) {
        self.center = view.center
        view.addSubview(self)
        setupButton()
    }
    
    
    //MARK: - metods button
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animateToActiveState()
    }

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouch(touches, touchEnded: false)
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouch(touches, touchEnded: true)
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        animateToDefaultState()
    }

    func handleTouch(_ touches: Set<UITouch>, touchEnded: Bool) {
        if let touchLocationInSuperview: CGPoint = touches.first?.location(in: self.superview) {
            let touchLocation: CGPoint = self.convert(touchLocationInSuperview, to: self)
            if frame.contains(touchLocation) {
                if touchEnded {
                    animateToDefaultState()
                    delegate?.didTap(from: self)
                } else {
                    animateToActiveState()
                }
            } else {
                animateToDefaultState()
            }
        } else {
            animateToDefaultState()
        }
    }

    func animateToActiveState() {
        isHighlighted = true
    }

    func animateToDefaultState() {
        isHighlighted = false
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
class ViewController: UIViewController, WAlertOptionButtonDelegate {
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
        
        let alertButtonSecond = WAlertOptionButtonSecond(frame: CGRect(x: 0, y: 0, width: 100, height: 50), title: "")
        alertButtonSecond.showButtons(view: view)
        view.addSubview(alertButtonSecond)
        alertButtonSecond.delegates = self
     
        
        
}
}

