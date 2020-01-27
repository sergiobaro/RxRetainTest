import UIKit
import RxSwift
import LifetimeTracker


class NoApparentLeakViewController: UIViewController, LifetimeTrackable {
    
    private let presenter = Presenter()
    private let disposeBag = DisposeBag()
    
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
        
        self.presenter.viewIsReady()
            .debug()
            .subscribe(onNext: doSomething) // self strong reference
            .disposed(by: self.disposeBag)
    }
    
    private func doSomething() {
        print("Doing Something")
    }
    
}

