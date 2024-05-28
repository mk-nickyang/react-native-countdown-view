@objc(CountdownViewManager)
class CountdownViewManager: RCTViewManager {

  // This method returns a new instance of CountdownView
  override func view() -> (CountdownView) {
    return CountdownView()
  }

  // This method specifies whether the view should be created on the main thread
  @objc override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
