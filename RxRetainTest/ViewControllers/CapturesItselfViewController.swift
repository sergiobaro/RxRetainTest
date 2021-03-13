import UIKit


class CapturesItselfViewController: UIViewController {

  private var doSomething: () -> Void = { }

  deinit {
    print(">>> Deinit: \(String(describing: type(of: self)))")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    doSomething = {
      self.doSomethingFunction() // unknowed or weak will prevent the leak
    }
    doSomething()
  }

  private func doSomethingFunction() {
    print("doSomething")
  }
}

