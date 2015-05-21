#lang pollen

◊headline{Kitchen Timer}

In this example, we’re going to build a timer. This timer is particular useful in kitchen. Imagine now we are cooking a fish and want to get an alert after 2 minutes 30 seconds. We can launch the app and set up the timer in few taps. Then we will get alert without worrying getting the fish over-cooked.

- Auto Layout
- Local Notification
- Extension


◊(define base "/ios-app/kitchen-timer/")
◊(define (local text) (string-append base text))

Step 1: ◊link[(local "step1.html")]{Preparing the project.}
Step 2: ◊link[(local "step2-auto-layout.html")]{Setup the Auto Layout.}
Step 3: ◊link[(local "step3-local-notification.html")]{Scheduling Local Notification.}

