import UIKit
import RxSwift


class NoApparentLeakViewController: UIViewController {
    
    private let presenter = Presenter()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.viewIsReady()
            .debug()
            .subscribe(onNext: doSomething) // self strong reference
            .disposed(by: self.disposeBag)
    }
    
    private func doSomething() {
        print("Doing Something")
    }
    
}

