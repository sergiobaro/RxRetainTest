import UIKit
import RxSwift


class TakeOneLeakViewController: UIViewController {

  private let presenter = Presenter()

  deinit {
    print(">>> Deinit: \(String(describing: type(of: self)))")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    _ = self.presenter.viewIsReady()
      .debug()
      .take(1)
      .subscribe(onNext: {
        self.doSomething() // unowned or weak will prevent the leak
      }) // after take 1 the sequence will be deallocated,
    // but if the event doesn't happen then the whole sequence is leaked
  }

  @IBAction func tapDoSomething() {
    self.presenter.userDoSomething()
  }

  private func doSomething() {
    print("Do something")
  }
}
