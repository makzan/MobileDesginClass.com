#lang pollen

◊headline{Step 3—A class for email settings}

◊(steps
  ◊step{Create a new class file named ◊code{EmailSetting}.}
  ◊step{Inside the file, add the following code:
    ◊swift{
      let EMAIL_TO_KEY = "EMAIL_TO_KEY"
      let EMAIL_FROM_KEY = "EMAIL_FROM_KEY"

      class EmailSetting: NSObject {
        static let sharedSetting = EmailSetting()

        func userDefaults() -> NSUserDefaults {

          let ud = NSUserDefaults(suiteName: "group.net.makzan.QuickMailMe")

          if (ud != nil) {
              return ud!
          }

          return NSUserDefaults.standardUserDefaults()
        }

        func save(toEmail:String, fromEmail:String) {
          userDefaults().setObject(toEmail, forKey: EMAIL_TO_KEY)
          userDefaults().setObject(fromEmail, forKey: EMAIL_FROM_KEY)
          userDefaults().synchronize()
        }

        func load() -> (String, String){
          var to = userDefaults().stringForKey(EMAIL_TO_KEY)
          var from = userDefaults().stringForKey(EMAIL_FROM_KEY)

          if (to == nil) {
              to = ""
          }

          if (from == nil) {
              from = ""
          }

          return (to!, from!)
        }
      }
    }
  }
)

◊section{What just happened?}

This ◊code{EmailSetting} class serves as a centralize class to save and load the input email setting.

We can use the class with something like the following:

◊swift{
  EmailSetting.sharedSetting.save("mak@example.com", from:"abc@example.com")
  EmailSetting.sharedSetting.load()
}
