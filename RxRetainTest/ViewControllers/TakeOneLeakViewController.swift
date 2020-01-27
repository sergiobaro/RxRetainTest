import UIKit
import RxSwift
import LifetimeTracker


class TakeOneLeakViewController: UIViewController, LifetimeTrackable {
    
    private let presenter = Presenter()
    
    static var lifetimeConfiguration: LifetimeConfiguration {
        .init(maxCount: 1)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        trackLifetime()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        trackLifetime()
    }
    
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
