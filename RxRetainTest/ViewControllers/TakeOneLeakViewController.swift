import UIKit
import RxSwift


class TakeOneLeakViewController: UIViewController {
    
    private let presenter = Presenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = self.presenter.viewIsReady()
            .debug()
            .take(1)
            .subscribe(onNext: {
                self.doSomething()
            })
    }
    
    @IBAction func tapDoSomething() {
        self.presenter.userDoSomething()
    }
    
    private func doSomething() {
        print("Do something")
    }
    
}
