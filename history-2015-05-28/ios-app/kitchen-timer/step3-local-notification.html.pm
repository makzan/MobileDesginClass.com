#lang pollen

◊headline{Step 3—Local Notification}

We use LocalNotification to schedule the time up message.

◊sidenote{
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%2012.19.57%20PM.png"]{Prompting user for allowing notification.}
}

The usage of local notification:

◊swift{
  UIApplication.sharedApplication().scheduleLocalNotification(notification)
}

◊time-for-action{Creating LocalNotificationManager}

◊steps{
  ◊step{Create a new class file named ◊code{LocalNotificationManager.swift}.}

  ◊step{Add the following singleton declaration to the class:
    ◊swift{
      static let sharedManager = LocalNotificationManager()
    }
  }

  ◊step{Before scheduling any notifications, we need to grant the permission from the user. We define the following function that register the notification and defining the notification actions.

    ◊swift{
      func registerNotification() {
          // type
          let type = UIUserNotificationType.Alert | UIUserNotificationType.Badge | UIUserNotificationType.Sound

          // actions
          let action1 = UIMutableUserNotificationAction()
          action1.identifier = "EXTRA_30S"
          action1.title = "+30s"
          action1.activationMode = UIUserNotificationActivationMode.Background
          action1.destructive = false
          action1.authenticationRequired = false


          // action category
          let category = UIMutableUserNotificationCategory()
          category.identifier = "EXTRA_TIME_CATEGORY"
          category.setActions([action1], forContext: UIUserNotificationActionContext.Default)
          category.setActions([action1], forContext: UIUserNotificationActionContext.Minimal)

          // setting
          let setting = UIUserNotificationSettings(forTypes: type, categories: [category])

          // really register
          UIApplication.sharedApplication().registerUserNotificationSettings(setting)
      }
    }
  }

  ◊step{We define the following function that really schedule the local notification.

    ◊swift{
      // MARK: - Scheduling notification

      func scheduleNotificationWithInterval(seconds:NSTimeInterval) {
          let notification = UILocalNotification()
          notification.fireDate = NSDate(timeIntervalSinceNow: seconds)
          notification.timeZone = NSTimeZone.defaultTimeZone()
          notification.alertBody = "Time’s up"
          notification.alertAction = "Dismiss"
          notification.soundName = UILocalNotificationDefaultSoundName
          notification.applicationIconBadgeNumber = 0
          notification.category = "EXTRA_TIME_CATEGORY"

          UIApplication.sharedApplication().scheduleLocalNotification(notification)
      }
    }
  }

  ◊step{Then we add the following 2 functions that manage existing notifications.

    ◊swift{
      // MARK: - Managing existing notifications

      func hasNotifications() -> Bool {
          return UIApplication.sharedApplication().scheduledLocalNotifications.count > 0
      }

      func removeAllNotifications() {
          UIApplication.sharedApplication().cancelAllLocalNotifications()
      }
    }
  }

  ◊step{At last, we prompt the user for registration.

    ◊swift{
      // register notification
      LocalNotificationManager.sharedInstance.registerNotification()
    }
  }
}

◊section{What just happened?}

We just scheduled a local notification that alerts in exactly 30 seconds. The alert time is calculate by system to ensure its precision. Another benefit to use notification is that it allows the user to switch to another app during the counting. The user can even kill the app or restart the iPhone. This is a system level scheduling that the alert triggers except the app get deleted or the device is shut down.


We can add extra logic to notification by providing categories, which each ◊em{category} contains a couple of actions.

◊sidenote{
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/IMG_0274.jpg"]{Properties for notification action.}
}

There are several properties that we define an ◊em{action}. Here is the code we wrote:

◊swift{
  action1.identifier = "EXTRA_30S"
  action1.title = "+30s"
  action1.activationMode = UIUserNotificationActivationMode.Background
  action1.destructive = false
  action1.authenticationRequired = false
}

◊terms{
  ◊term["identifier"]{A unique string that the system identifies the action.}
  ◊term["title"]{The string that is visible to user.}
  ◊term["activationMode"]{Define if the logic needs to bring the app to ◊em{foreground} or can keep the app executes the logic in ◊em{background}.}
  ◊term["destructive"]{A ◊em{true} value gives the action button a ◊em{Red} background.}
  ◊term["authenticationRequired"]{Can user executes this action logic without unlocking the iPhone?}
}


We will handle the action with our customize logic later. Now we have completed the basic local notification functionality. In next step, we’ll work on the ◊em{+30s} and ◊em{-30s} buttons.

◊btw{
  ◊item{There is no difference in user’s view for ◊em{remote notification} and ◊em{local notification}}
  ◊item{We should carefully design when to prompt user for the notification permission. Asking the permission in wrong timing may result in deny.}
  ◊item{There is no way to programmatically trigger the prompt again after deny. User need to manuanlly turn on notification for your app inside the OS setting app.}
}