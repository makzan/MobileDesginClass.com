#lang pollen

◊headline{Step 5—Implementing MZTimer}

In this step, we implement the timer utility class. We call it ◊code{MZTimer}. It comes with a mutable companion—◊code{MZMutableTimer}.

◊(steps
  ◊step{Create a new class file named ◊code{MZTimer.swift}.}
  ◊step{Create a new class file named ◊code{MZMutableTimer.swift}, which extends the ◊code{MZTimer} class.}

  ◊step{
    ◊swift{
      let TIMER_START_AT_KEY = "TimerStartedAt"
      let TIMER_DURATION_KEY = "TargetDuration"
    }
  }

  ◊step{
    ◊swift{
      class MZTimer: NSObject {
        static let sharedTimer = MZTimer()

        func sharedUserDefault() -> NSUserDefaults {
          return NSUserDefaults.standardUserDefaults()
        }

        func isRunning() -> Bool {
          let userDefault = sharedUserDefault()
          if ((userDefault.objectForKey(TIMER_START_AT_KEY)) != nil) {
            return true
          }
          return false
        }

        func elapsedSeconds() -> NSTimeInterval {
          let userDefault = sharedUserDefault()

          if (userDefault.objectForKey(TIMER_START_AT_KEY) == nil) {
            return 0
          }

          let startedAt = userDefault.objectForKey(TIMER_START_AT_KEY) as! NSDate

          return startedAt.timeIntervalSinceNow
        }

        func targetDuration() -> NSTimeInterval {
          let userDefault = sharedUserDefault()

          if (userDefault.objectForKey(TIMER_DURATION_KEY) == nil) {
            return 0
          }

          return userDefault.objectForKey(TIMER_DURATION_KEY) as! NSTimeInterval
        }

        func remainSeconds() -> NSTimeInterval {
          let elapsedSeconds = MZTimer.sharedTimer.elapsedSeconds()
          let targetDuration = MZTimer.sharedTimer.targetDuration()
          return targetDuration - elapsedSeconds
        }
      }
    }
  }

  ◊step{Then we implement the ◊code{MZMutableTimer} class which inherits the ◊code{MZTimer}. This class handles all the local notification’s scheduling and canceling.
    ◊swift{
      class MZMutableTimer: MZTimer {
        static let sharedMutableTimer = MZMutableTimer()

        func scheduleAlertForSeconds(seconds:NSTimeInterval) {
          LocalNotificationManager.sharedManager.removeAllNotifications()
          LocalNotificationManager.sharedManager.scheduleNotificationWithInterval(seconds)

          let userDefault = sharedUserDefault()
          userDefault.setObject(NSDate(), forKey: TIMER_START_AT_KEY)
          userDefault.setDouble(seconds, forKey: TIMER_DURATION_KEY)
          userDefault.synchronize()
        }

        func cancelAlerts() {
          LocalNotificationManager.sharedManager.removeAllNotifications()

          let userDefault = sharedUserDefault()
          userDefault.removeObjectForKey(TIMER_START_AT_KEY)
          userDefault.removeObjectForKey(TIMER_DURATION_KEY)
        }

        func cancelAlertsIfZero() {
          if (remainSeconds() <= 0) {
            cancelAlerts()
          }
        }
      }
    }
  }
  ◊step{We want to reset the timer if the counting is done while the application is in background. In the ◊code{AppDelegate}, we tell the ◊code{MZMutableTimer} to reset any alerts if the count down has completed.
    ◊swift{
      func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        MZMutableTimer.sharedMutableTimer.cancelAlertsIfZero()

        return true
      }
    }
    ◊swift{
      func applicationDidBecomeActive(application: UIApplication) {
        MZMutableTimer.sharedMutableTimer.cancelAlertsIfZero()
      }
    }
  }
)