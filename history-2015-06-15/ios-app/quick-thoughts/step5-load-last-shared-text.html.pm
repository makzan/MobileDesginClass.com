#lang pollen

◊headline{Step 5—Loading last shared text}


◊(steps
  ◊step{In the interface builder, we add a ◊code{BarButtonItem} to the right side of the navigation bar. We give it a title ◊em{“Load”}.}
  ◊step{We link the action of the ◊em{Load} button to the ◊code{ViewController.swift} as IBAction ◊code{loadText:}.}
  ◊step{At the beginning of the ◊code{ViewController.swift} file, we added a ◊code{SAVED_TEXT_KEY} constant. After that, we add the following constant.
    ◊swift{
      let LAST_TEXT_KEY  = "LAST_TEXT_KEY"
    }
  }
  ◊step{In the ◊code{afterShare} function, we add the following code that stores the text into user defaults with key ◊code{LAST_TEXT_KEY}. The ◊code{afterShare} funciton becomes:
    ◊swift{
      func afterShare() {
        // before clearing the text, we store it.
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setObject(self.mainTextView.text, forKey: LAST_TEXT_KEY)

        // clear the text view
        self.mainTextView.text = ""

        // show the keyboard again
        self.mainTextView.becomeFirstResponder()

        // clear saved content also
        userDefault.removeObjectForKey(SAVED_TEXT_KEY)
      }
    }
  }
  ◊step{Then we implement the ◊code{loadText} IBAction.
    ◊swift{
      @IBAction func loadText(sender: AnyObject) {
        // check if text view has un-saved text
        if (self.mainTextView.text.isEmpty) {
          loadLastText()
        }else {
          // prompt alert view
          let alertController = UIAlertController(title: "Un-saved text", message: "You have un-saved text. Do you want to override your text?", preferredStyle: UIAlertControllerStyle.Alert)
          alertController.addAction(UIAlertAction(title: "Load and override", style: UIAlertActionStyle.Destructive, handler: { (action) -> Void in
              self.loadLastText()
          }))
          alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
          self.presentViewController(alertController, animated: true, completion: nil)
        }
      }
      func loadLastText() {
        let userDefault = NSUserDefaults.standardUserDefaults()
        if (userDefault.objectForKey(LAST_TEXT_KEY) != nil) {
          self.mainTextView.text = userDefault.stringForKey(LAST_TEXT_KEY)
        }
      }
    }
  }
)