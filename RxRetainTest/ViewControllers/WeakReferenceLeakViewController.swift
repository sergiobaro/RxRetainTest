import UIKit
import RxSwift
import LifetimeTracker


class WeakReferenceLeakViewController: UIViewController, LifetimeTrackable {
    
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
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.doSomething()
            })
    }
    
    private func doSomething() {
        print("Do something")
    }
    
}
