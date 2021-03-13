import UIKit
import RxSwift


class WeakReferenceLeakViewController: UIViewController {
  
  private let presenter = Presenter()

  deinit {
    print(">>> Deinit: \(String(describing: type(of: self)))")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    _ = self.presenter.viewIsReady()
      .debug()
      .subscribe(onNext: { [weak self] in
        guard let self = self else { return }
        self.doSomething()
      })
      // the view controller will be released but the sequence will be leaked
  }
  
  private func doSomething() {
    print("Do something")
  }
}
