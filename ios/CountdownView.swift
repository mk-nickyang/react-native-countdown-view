import UIKit

@objc(CountdownView)
class CountdownView: UIView {

  // This property is exposed to React Native to set the countdown time
  @objc var countdownTime: NSNumber = 0 {
    didSet {
      print("Countdown time set to: \(countdownTime)")
      self.startCountdown()
    }
  }

  // Label to display the countdown time
  private let countdownLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 32)
    label.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
    return label
  }()

  // Timer to update the countdown each second
  private var timer: Timer?

  // Initializer to set up the view
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(countdownLabel)
    countdownLabel.frame = bounds
    countdownLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    print("CountdownView initialized")
  }

  // Required initializer for UIView subclasses
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // Starts the countdown timer
  private func startCountdown() {
    timer?.invalidate() // Invalidate any existing timer
    countdownLabel.text = "\(countdownTime)" // Set initial countdown time
    // Schedule a timer to call updateCountdown every second
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
  }

  // Method called by the timer to update the countdown
  @objc private func updateCountdown() {
    if countdownTime.intValue > 0 {
      countdownTime = NSNumber(value: countdownTime.intValue - 1) // Decrement the countdown time
      countdownLabel.text = "\(countdownTime)" // Update the label text
    } else {
      timer?.invalidate() // Invalidate the timer when countdown reaches zero
    }
  }
}
