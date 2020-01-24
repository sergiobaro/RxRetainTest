import UIKit
import RxSwift


class StrongReferenceLeakViewController: UIViewController {
    
    private let presenter = Presenter()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.viewIsReady()
            .debug()
            .subscribe(onNext: {
                self.doSomething()
            })
            .disposed(by: self.disposeBag)
    }
    
    private func doSomething() {
        print("Do something")
    }
    
}

