import UIKit
import RxSwift
import RxCocoa

class StrongReferenceLeakViewController: UIViewController {
    
    @IBOutlet private weak var popButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.popButton.rx.tap
            .subscribe(onNext: {
                self.navigationController?.popViewController(animated: true)
            })
            .disposed(by: self.disposeBag)
    }
    
}

