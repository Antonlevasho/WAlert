import UIKit

final class WAlert: UIView {

    var title: String?

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        self.title = "asdasd"
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 20


        let info = WAlertOptionButtonInfo(title: "sasx")
        let button = WAlertOptionButton(info: info)
        let buttonTwo = WAlertOptionButton(info: info)

        self.addSubview(button)





    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func showAlert(onView view: UIView) {
        self.center = view.center
        view.addSubview(self)

        // Анимация появления
        self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
            self.transform = CGAffineTransform.identity
        }
    }

}
