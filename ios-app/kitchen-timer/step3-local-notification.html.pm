#lang pollen

◊headline{Step 3—Local Notification}

◊sidenote{
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%2012.19.57%20PM.png"]{Prompting user for allowing notification.}
}

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/IMG_0274.jpg"]{Properties for notification action.}

◊swift{
  UIApplication.sharedApplication().scheduleLocalNotification(notification)
}

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

  // MARK: - Managing existing notifications

  func hasNotifications() -> Bool {
      return UIApplication.sharedApplication().scheduledLocalNotifications.count > 0
  }

  func removeAllNotifications() {
      UIApplication.sharedApplication().cancelAllLocalNotifications()
  }
}

At last, we prompt the user for registration.

◊swift{
  // register notification
  LocalNotificationManager.sharedInstance.registerNotification()
}

◊btw{
  ◊item{There is no difference in user’s view for ◊em{remote notification} and ◊em{local notification}}
  ◊item{We should carefully design when to prompt user for the notification permission. Asking the permission in wrong timing may result in deny.}
  ◊item{There is no way to programmatically trigger the prompt again after deny. User need to manuanlly turn on notification for your app inside the OS setting app.}
}