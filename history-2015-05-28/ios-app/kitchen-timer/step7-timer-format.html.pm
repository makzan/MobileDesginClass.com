#lang pollen

◊headline{Step 7—Timer Format}

◊sidenote{
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-28%20at%201.08.05%20PM.png"]{Screenshot of the timer counting down}
}

◊(steps
  ◊step{Create a new file named ◊code{NSNumber+MZTimerFormat.swift}.
    ◊swift{
      import UIKit

      extension NSNumber {
        func stringOfMinutesSeconds () -> NSString{
          if (integerValue < 0) {
            return "00:00"
          }
          let m = integerValue / 60
          let s = integerValue % 60
          return NSString(format: "%02d:%02d", m, s)
        }
      }
    }
  }

  ◊step{In the ◊code{tick} method, we change to the following code:
    ◊swift{
      func tick() {
        let elapsedSeconds = MZTimer.sharedTimer.elapsedSeconds()
        let targetDuration = MZTimer.sharedTimer.targetDuration()
        let remainSeconds:NSNumber = targetDuration + elapsedSeconds // elapsedSeconds is always negative.

        countDownLabel.text = remainSeconds.stringOfMinutesSeconds() as String
      }
    }
  }

  ◊step{Try to run the app. Add 30 seconds and press start. We can now see the timer label is counting down.}

  ◊step{We can improve the ◊code{tick} method. Replace the tick method with the following code:
    ◊swift{
      func tick() {
        // only tick the UI timer when the MZTimer is running for any local notification.
        if (!MZTimer.sharedTimer.isRunning()) {
          countDownLabel.text = (seconds as NSNumber).stringOfMinutesSeconds() as String
          showPrepareUI()
          return
        }

        showRunningUI()

        let elapsedSeconds = MZTimer.sharedTimer.elapsedSeconds()
        let targetDuration = MZTimer.sharedTimer.targetDuration()
        let remainSeconds:NSNumber = targetDuration + elapsedSeconds // elapsedSeconds is always negative.

        countDownLabel.text = remainSeconds.stringOfMinutesSeconds() as String
      }
    }
  }
)

◊btw{
  ◊item{Swift automatically bridges Double, Integer, Bool into NSNumber. But it won’t automatically cast it.}
  ◊item{We have cast the NSString into String for UILabel text.}
  ◊item{Extensions is similar to ◊code{Category} in Objective-C.}
}