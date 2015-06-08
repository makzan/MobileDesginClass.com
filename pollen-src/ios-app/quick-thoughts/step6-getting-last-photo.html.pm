#lang pollen

◊headline{Step 6—Getting last photo}


◊(steps
  ◊step{In the interface builder, add a ◊em{Long Press} gesture recognizer to the save button.}
  ◊step{To use the PhotoKit, we need to import the framework at the beginning of the file. After the existing ◊code{import UIKit} line, add the following line:
    ◊swift{
      import Photos
    }
  }
  ◊step{We implement the following function to get the last photo.
    ◊swift{
      // MARK: - Get Last Photo
      func getLastPhoto(completion:(image:UIImage)->Void) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]

        let fetchResult = PHAsset.fetchAssetsWithOptions(fetchOptions)
        let lastPhoto = fetchResult.lastObject as! PHAsset

        NSLog("last Photo: %@", lastPhoto)

        let requestOptions = PHImageRequestOptions()
        requestOptions.synchronous = true

        PHImageManager.defaultManager().requestImageDataForAsset(lastPhoto, options: requestOptions, resultHandler: { (imageData, dataUTI, orientation, info) -> Void in

          NSLog("image data: %@", imageData)

          let photo = UIImage(data: imageData)

          NSLog("photo: %@", photo!)
          completion(image: photo!)
        })
      }
    }
  }
  ◊step{Link the Long Press action to the ◊code{ViewController.swift} as IBAction ◊code{longPressSaveThought:}.}
  ◊step{
    ◊swift{Then we implement the long press gesture handler.
       @IBAction func longPressSaveThought(sender: AnyObject) {
        // ask if want to include the last photo
        let alertView = UIAlertController(title: "Save Thought", message: "Do you want to include the last image in Photo Library?", preferredStyle: UIAlertControllerStyle.ActionSheet)

        alertView.addAction(UIAlertAction(title: "Save with last photo", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            self.getLastPhoto({ (lastPhoto) -> Void in
              self.shareItems([self.mainTextView.text, lastPhoto])
            })

        }))

        alertView.addAction(UIAlertAction(title: "Save the text", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            self.shareItems([self.mainTextView.text])
        }))


        alertView.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))

        // for iPad
        alertView.popoverPresentationController?.sourceView = self.saveButton

        self.presentViewController(alertView, animated: true, completion: nil)

      }
    }
  }
)


◊section{What just happened?}

We enhanced the project with ability to share last photo alongside the text.


You may check the ◊link["https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html"]{Swift guide on using the Closures}.