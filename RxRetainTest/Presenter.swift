import Foundation
import RxSwift


class Presenter {

  private let subject = PublishSubject<Void>()

  func viewIsReady() -> Observable<Void> {
    return subject.asObservable()
  }

  func userDoSomething() {
    subject.onNext(())
  }
}
