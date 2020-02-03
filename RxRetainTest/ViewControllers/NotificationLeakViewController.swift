import UIKit
import RxSwift
import RxCocoa

class NotificationLeakViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.rx
            .notification(UIResponder.keyboardWillShowNotification)
            .debug()
            .subscribe(onNext: keyboardWillShow(notification:))
            .disposed(by: self.disposeBag)
    }
    
    private func keyboardWillShow(notification: Notification) {
        
    }
    
}
