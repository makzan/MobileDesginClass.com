#lang pollen

◊headline{Example Project—Secrets}

In this example, we create a secret app. This app makes use of the Parse.com as a backend. Then we create the front end client with we view and UITextView. We also create an admin edition that manages the submitted secrets.

Side note: this is known as backend-as-a-service. Firebase is an alternative.

What we will learn:
- Revisit table view
- Using Parse.com as backend

◊(define base "/ios-app/secrets/")
◊(define (local text) (string-append base text))

Step 1: ◊link[(local "step1-prototyping-in-storyboard.html")]{Prototyping the app in Storyboard}
Step 2: ◊link[(local "step2-installing-parse.html")]{Installing Parse}
Step 3: ◊link[(local "step3-secrets-model.html")]{Implement the Secrets model}
Step 4: ◊link[(local "step4-initialize-parse.html")]{Initialize Parse}
Step 5: ◊link[(local "step5-html-show-secret.html")]{HTML showing secrets}
Step 6: ◊link[(local "step6-view-controller.html")]{View Controller}
Step 7: ◊link[(local "step7-compose-secret.html")]{Compose Secrets}
Step 8: ◊link[(local "step8-admin.html")]{Admin panel}