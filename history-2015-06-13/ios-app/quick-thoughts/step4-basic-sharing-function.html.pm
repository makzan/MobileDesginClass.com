#lang pollen

◊headline{Step 4—Basic Sharing Function}

In this step, we create the the core function—text sharing.

◊(steps
  ◊step{We define a function that share a given collection of items.
    ◊swift{
      // MARK: - Activity Controller
      func shareItems(items:[AnyObject]) {
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)

        // for email sharing
        activityViewController.setValue("Quick Thoughts", forKey: "Subject")

        // for iPad
        activityViewController.popoverPresentationController?.sourceView = self.saveButton;

        activityViewController.completionWithItemsHandler = { activity, success, items, error in

          // content did shared
          if (success) {
            self.afterShare()
          }
        }

        let parentVC = UIApplication.sharedApplication().keyWindow?.rootViewController
        parentVC?.presentViewController(activityViewController, animated: true, completion: nil)
      }
    }
  }
  ◊step{We need to define how we clean up the interface after a successful share. Define the following function:
    ◊swift{
      func afterShare() {
        // clear the text view
        self.mainTextView.text = ""

        // show the keyboard again
        self.mainTextView.becomeFirstResponder()

        // clear saved content also
        userDefault.removeObjectForKey(SAVED_TEXT_KEY)
      }
    }
  }
  ◊step{Then we call the ◊code{shareItems} function in the save button’s IBAction handler.
    ◊swift{
      // MARK: - UI Actions

      @IBAction func saveThought(sender: AnyObject) {
        shareItems([mainTextView.text])
      }
    }
  }
)

