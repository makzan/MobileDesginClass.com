#lang pollen

◊headline{Example Project—Kitchen Timer}

In this example, we’re going to build a timer. This timer is particular useful in kitchen. Imagine now we are cooking a fish and want to get an alert after 2 minutes 30 seconds. We can launch the app and set up the timer in few taps. Then we will get alert without worrying getting the fish over-cooked.

- Auto Layout
- Local Notification
- Extension


◊(define base "/ios-app/kitchen-timer/")
◊(define (local text) (string-append base text))

Step 1: ◊link[(local "step1.html")]{Preparing the project.}
Step 2: ◊link[(local "step2-auto-layout.html")]{Setup the Auto Layout.}
Step 3: ◊link[(local "step3-local-notification.html")]{Scheduling Local Notification.}
Step 4: ◊link[(local "step4-select-seconds.html")]{Select seconds to schedule.}
Step 5: ◊link[(local "step5-implement-mztimer.html")]{Implementing MZTimer.}
Step 6: ◊link[(local "step6-using-mztimer.html")]{Using MZTimer.}
Step 7: ◊link[(local "step7-timer-format.html")]{Timer Format.}
Step 8: ◊link[(local "step8-creating-today-extension.html")]{Creating today extension.}
Step 9: ◊link[(local "step9-handling-notification-event.html")]{Handling notification event.}

You may download the source code in the ◊link["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/KitchenTimer-Swift.zip"]{this link}.




