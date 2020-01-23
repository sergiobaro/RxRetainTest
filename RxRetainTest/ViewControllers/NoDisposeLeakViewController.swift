import UIKit
import RxSwift
import RxCocoa

class NoDisposeStrongReferenceLeakViewController: UIViewController {
    
    @IBOutlet private weak var popButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = self.popButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.pop()
            })
    }
    
    private func pop() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
