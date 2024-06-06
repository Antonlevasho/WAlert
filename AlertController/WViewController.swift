import UIKit
    
//MARK: - WViewController
class WViewController: UIViewController {
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private methods
private extension WViewController {
    func initialize() {
        view.backgroundColor = .white
        let alertController = WAlert(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        alertController.showAlert(onView: self.view)
    }
}
