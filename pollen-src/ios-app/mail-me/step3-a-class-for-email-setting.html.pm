#lang pollen

◊headline{Step 3—A class for email settings}

◊(steps
  ◊step{Create a new class file named ◊code{EmailSetting}.}
  ◊step{Inside the file, add the following code:
    ◊swift{
      let EMAIL_TO_KEY = "EMAIL_TO_KEY"
      let EMAIL_FROM_KEY = "EMAIL_FROM_KEY"
      let EMAIL_SUBJECT_KEY = "EMAIL_SUBJECT_KEY"

      class EmailSetting: NSObject {
        static let sharedSetting = EmailSetting()

        func userDefaults() -> NSUserDefaults {

          let ud = NSUserDefaults(suiteName: "group.net.makzan.QuickMailMe")

          if (ud != nil) {
              return ud!
          }

          return NSUserDefaults.standardUserDefaults()
        }

        func save(subject subject:String, to toEmail:String, from fromEmail:String) {
          userDefaults().setObject(subject, forKey: EMAIL_SUBJECT_KEY)
          userDefaults().setObject(toEmail, forKey: EMAIL_TO_KEY)
          userDefaults().setObject(fromEmail, forKey: EMAIL_FROM_KEY)
          userDefaults().synchronize()
        }

        func load() -> (String, String){
          var to = userDefaults().stringForKey(EMAIL_TO_KEY)
          var from = userDefaults().stringForKey(EMAIL_FROM_KEY)
          var subject = userDefaults().stringForKey(EMAIL_SUBJECT_KEY)

          if (to == nil) {
              to = ""
          }

          if (from == nil) {
              from = ""
          }

          if (subject == nil) {
            subject = ""
        }

          return (subject!, to!, from!)
        }
      }
    }
  }
)

◊section{What just happened?}

This ◊code{EmailSetting} class serves as a centralize class to save and load the input email setting.

We can use the class with something like the following:

◊swift{
  EmailSetting.sharedSetting.save(subject: "test@example.com", to: "test@example.com", from: "test@example.com")
  EmailSetting.sharedSetting.load()
}
