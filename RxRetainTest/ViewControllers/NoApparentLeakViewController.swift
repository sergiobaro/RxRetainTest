import UIKit
import RxSwift
import RxCocoa

class NoApparentLeakViewController: UIViewController {
    
    @IBOutlet private weak var popButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.popButton.rx.tap
            .subscribe(onNext: pop)
            .disposed(by: self.disposeBag)
    }
    
    private func pop() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

