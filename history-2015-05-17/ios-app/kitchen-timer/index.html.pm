#lang pollen

◊headline{Kitchen Timer}

In this example, we’re going to build a timer.

- Auto Layout
- Local Notification
- Extension


◊(define base "/ios-app/kitchen-timer/")
◊(define (local text) (string-append base text))

Step 1: ◊link[(local "step1.html")]{Step 1}

Source Code:

◊link[(local "local-notification-manager.html")]{LocalNotificationManager}
◊link[(local "nsnumber-category.html")]{NSNumber+MZTimer}
