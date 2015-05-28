#lang pollen

◊headline{Step 6—Using MZTimer}

We implemented the ◊code{MZTimer} and ◊code{MZMutableTimer}, now we use it in our application.

◊(steps
  ◊step{
    ◊swift{
      @IBOutlet weak var countDownLabel: UILabel!
    }
  }

  ◊step{Inside ◊code{viewDidLoad}.
    ◊swift{
      if (MZTimer.sharedTimer.isRunning()) {
        showRunningUI()
      } else {
        showPrepareUI()
      }
    }
  }

  ◊step{
    ◊swift{
      @IBAction func startTimer(sender: AnyObject) {
        showRunningUI()
        MZMutableTimer.sharedMutableTimer.scheduleAlertForSeconds(seconds)
      }

      @IBAction func cancelTimer(sender: AnyObject) {
        showPrepareUI()
        MZMutableTimer.sharedMutableTimer.cancelAlerts()
      }
    }
  }

  ◊step{
    ◊swift{
      // MARK: - Timer interface
      func startUITimer() {
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "tick", userInfo: nil, repeats: true)
      }

      func tick() {
        let elapsedSeconds = MZTimer.sharedTimer.elapsedSeconds()

        NSLog("%02.0f", elapsedSeconds)

        countDownLabel.text = NSString(format: "%02.0f", elapsedSeconds) as String

        // TODO: make the counting format nicer.
      }
    }
  }

)


