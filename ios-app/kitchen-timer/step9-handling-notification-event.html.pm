#lang pollen

◊headline{Step 9—Handling notification event}

◊(steps
  ◊step{We handle the +30s action.
    ◊swift{
      func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {

        MZMutableTimer.sharedMutableTimer.scheduleAlertForSeconds(30.0)
      }
    }
  }
  ◊step{At last, we handle the notification when the app in running in foreground.
    ◊swift{
      // MARK: Notification Registration
      func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {

        MZMutableTimer.sharedMutableTimer.cancelAlerts()

        // Alert
        let alert = UIAlertController(title: "Alert", message: "Time’s up", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "+30s", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            MZMutableTimer.sharedMutableTimer.scheduleAlertForSeconds(30.0)
        }))

        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
      }
    }
  }
)