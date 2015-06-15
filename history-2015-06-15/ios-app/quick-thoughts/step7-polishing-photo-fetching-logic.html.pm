#lang pollen

◊headline{Step 7—Polishing photo fetching logic}

We built all the core logic to make the app works. Now we want to polish the photo fetching logic.

◊(steps
  ◊step{We define an instant variable that stores the pre-fetched last photo.
    ◊swift{
      var lastPhoto: UIImage?
    }
  }
  ◊step{We prepare a function to ask for the permission.
    ◊swift{
      func askForPhotoPremission() {
        PHPhotoLibrary.requestAuthorization { (status) -> Void in
          if (status == .Authorized) {
            NSOperationQueue.mainQueue().addOperationWithBlock {
              self.preloadLastPhoto()
            }
          }
        }
      }
    }
  }
  ◊step{We want to preload the photo. Define the following function:
    ◊swift{
      func preloadLastPhoto() {
        if PHPhotoLibrary.authorizationStatus() == .Authorized {
          self.getLastPhoto({ (image) -> Void in
            self.lastPhoto = image
          })
        }
      }
    }
  }
  ◊step{One more step. The last photo may have changed since
    ◊swift{
      func handlePhotoChanges() {
        if PHPhotoLibrary.authorizationStatus() == .Authorized {
          PHPhotoLibrary.sharedPhotoLibrary().registerChangeObserver(self)
        }
      }
    }
  }
  ◊step{Add the protocol to the class header. The header becomes:
    ◊swift{
      class ViewController: UIViewController, UITextViewDelegate, PHPhotoLibraryChangeObserver
    }
  }
  ◊step{Implement the ◊code{photoLibraryDidChange} function.
    ◊swift{
      func photoLibraryDidChange(changeInstance: PHChange) {
        self.preloadLastPhoto()
      }
    }
  }
  ◊step{In the ◊code{viewDidLoad}, we add the functions we just created. The ◊code{viewDidLoad} becomes the following:
    ◊swift{
      override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        initTextViewContent()

        registerKeyboardEvents()

        mainTextView.becomeFirstResponder()

        askForPhotoPremission()

        preloadLastPhoto()

        handlePhotoChanges()
      }
    }
  }
  ◊step{Now in the ◊code{longPressSaveThought} function, after user selects “Save with Last Photo”, we don’t fetch the photo anymore, instead, we use it:
    ◊swift{
      if (self.lastPhoto == nil) {
        if PHPhotoLibrary.authorizationStatus() == .Authorized {
          self.promptForPhotoFailing()
        }else {
          self.promptForApprovalAgain()
        }

      } else {
        self.shareItems([self.mainTextView.text, self.lastPhoto!])
      }
    }
  }
  ◊step{The ◊code{promptForPhotoFailing} and ◊code{promptForApprovalAgain} is 2 functions that prompts the user that photo fetching fails.
    ◊swift{
      func promptForApprovalAgain() {
        let alertView = UIAlertController(title: "Photo Access", message: "The app needs your approval to access the last photo. Please enable it at Settings > Privacy > Photos", preferredStyle: UIAlertControllerStyle.Alert)
        alertView.addAction(UIAlertAction(title: "I understand", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alertView, animated: true, completion: nil)
      }

      func promptForPhotoFailing() {
        let alertView = UIAlertController(title: "Photo fails", message: "The app fails to fetch photo from the iCloud library. It may due to network issue. Please try again later.", preferredStyle: UIAlertControllerStyle.Alert)
        alertView.addAction(UIAlertAction(title: "I understand", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alertView, animated: true, completion: nil)
      }
    }
  }
)