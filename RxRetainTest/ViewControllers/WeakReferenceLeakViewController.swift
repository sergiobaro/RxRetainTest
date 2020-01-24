import UIKit
import RxSwift


class WeakReferenceLeakViewController: UIViewController {
    
    private let presenter = Presenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = self.presenter.viewIsReady()
            .debug()
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.doSomething()
            })
    }
    
    private func doSomething() {
        print("Do something")
    }
    
}
