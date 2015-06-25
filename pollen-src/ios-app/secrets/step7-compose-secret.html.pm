#lang pollen

◊headline{Step 7—Compose Secrets}

◊(steps
  ◊step{When the user presses the submit button, we save the content to the backend.
    ◊swift{
      @IBAction func submitSecret(sender: AnyObject) {
        Secrets.sharedSecrets.save(self.textview.text)
        textview.text = ""
        self.dismissViewControllerAnimated(true, completion: nil)
      }
    }
  }
)

Side note: I skipped the other view construction which handles the keyboard’s toggling and the changing of views to adapt the keyboard size.