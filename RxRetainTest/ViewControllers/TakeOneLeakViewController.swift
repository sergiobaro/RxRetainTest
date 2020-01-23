import UIKit
import RxSwift
import RxCocoa

class TakeOneStrongReferenceLeakViewController: UIViewController {
    
    @IBOutlet private weak var popButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = self.popButton.rx.tap
            .take(1)
            .subscribe(onNext: { [weak self] in
                self?.pop()
            })
    }
    
    private func pop() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
