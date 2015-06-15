#lang pollen

◊headline{Step 4—Select seconds to schedule}

◊(steps
  ◊step{Add 2 IBActions. Link the ◊code{touchUpInside} event of buttons of +30s and -30s to ◊code{add30s} and ◊code{minus30s} method.}

  ◊step{Let’s move to ◊code{ViewController.swift} file. Add the ◊code{seconds} instanc variable to the class.

    ◊swift{
      var seconds:NSTimeInterval = 0
    }
  }

  ◊step{Implement the IBActions that manipulate the seconds value.
    ◊swift{
      // MARK: - Select seconds
      @IBAction func add30s(sender: AnyObject) {
        seconds += 30
      }

      @IBAction func minus30s(sender: AnyObject) {
        seconds = max(seconds-30, 0) // minus 30, minimun 0.
      }
    }
  }

  ◊step{We originally hard-coded the notification time interval to 30 seconds. Now we change the hard-coded value by using the instant variable ◊code{seconds}.
    The old code:

    ◊swift{
      @IBAction func startTimer(sender: AnyObject) {
        showRunningUI()
        LocalNotificationManager.sharedManager.scheduleNotificationWithInterval(30.0)
      }
    }

    Change to the following new code:

    ◊swift{
      @IBAction func startTimer(sender: AnyObject) {
        showRunningUI()
        LocalNotificationManager.sharedManager.scheduleNotificationWithInterval(seconds)
      }
    }
  }
)