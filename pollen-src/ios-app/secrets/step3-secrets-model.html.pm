#lang pollen

◊headline{Step 3—Implement the Secrets model}

We create this ◊code{Secrets} model class to handle all the Parse.com’s data fetching and saving.

◊(steps
  ◊step{Create a new class named ◊code{Secrets}.}
  ◊step{Implement the class as following:
    ◊swift{
      import UIKit

      import Parse
      import Bolts

      class Secrets: NSObject {
        static let sharedSecrets = Secrets()

        var entries:NSArray = []

        func defaultSecretContent() -> String {
            return "Sample Secret"
        }

        func nextSecretContent() -> String {
          if entries.count > 0 {
            // get random entry from array
            let index = Int(arc4random_uniform(UInt32(entries.count)));

            let secret = Secrets.sharedSecrets.entries[index] as! PFObject
            return secret["content"] as! String
          }
          return defaultSecretContent()
        }

        func save(content:String) {
          let newSecret = PFObject(className: "Secret")
          newSecret["content"] = content
          newSecret["is_public"] = false
          newSecret.saveEventually()
        }

        func loadEntries() {
          let query = PFQuery(className: "Secret")
          query.whereKey("is_public", equalTo: true)
          query.limit = 50
          query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error != nil {
              NSLog("Fetch error: %@", error!)
              return
            }

            self.entries = objects!

          }
        }

        // MARK: - Admin

        func allApprovedSecrets(callback:(entries:NSArray)->Void) {
          let query = PFQuery(className: "Secret")
          query.whereKey("is_public", equalTo: true)
          query.limit = 50
          query.findObjectsInBackgroundWithBlock { (objects, err) -> Void in
            callback(entries: objects!)
          }
        }
        func allNonApprovedSecrets(callback:(entries:NSArray)->Void) {
          let query = PFQuery(className: "Secret")
          query.whereKey("is_public", equalTo: false)
          query.limit = 50
          query.findObjectsInBackgroundWithBlock { (objects, err) -> Void in
            callback(entries: objects!)
          }
        }

        func approveSecret(secretObject:PFObject) {
          secretObject["is_public"] = true
          secretObject.saveEventually()
        }
        func unapproveSecret(secretObject:PFObject) {
          secretObject["is_public"] = false
          secretObject.saveEventually()
        }
        func deleteSecret(secretObject:PFObject) {
          secretObject.deleteInBackground()
        }
      }
    }
  }
)