#lang pollen

◊headline{Final source code of the project}

You may ◊link["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/QuickThoughts.zip"]{download the final source code}. And here is the full ◊code{ViewController.swift} file:

◊swift{
  import UIKit
  import Photos

  let SAVED_TEXT_KEY = "SAVED_TEXT_KEY"
  let LAST_TEXT_KEY  = "LAST_TEXT_KEY"

  class ViewController: UIViewController, UITextViewDelegate, PHPhotoLibraryChangeObserver {

      @IBOutlet weak var mainTextView: UITextView!
      @IBOutlet weak var bottomMargin: NSLayoutConstraint!
      @IBOutlet weak var saveButton: UIButton!

      var lastPhoto: UIImage?

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

      override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
      }

      func handlePhotoChanges() {
          if PHPhotoLibrary.authorizationStatus() == .Authorized {
              PHPhotoLibrary.sharedPhotoLibrary().registerChangeObserver(self)
          }
      }

      func askForPhotoPremission() {
          PHPhotoLibrary.requestAuthorization { (status) -> Void in
              if (status == .Authorized) {
                  NSOperationQueue.mainQueue().addOperationWithBlock {
                      self.preloadLastPhoto()
                  }
              }
          }
      }

      func preloadLastPhoto() {
          if PHPhotoLibrary.authorizationStatus() == .Authorized {
              self.getLastPhoto({ (image) -> Void in
                  self.lastPhoto = image
              })
          }
      }

      func photoLibraryDidChange(changeInstance: PHChange) {
          self.preloadLastPhoto()
      }


      // MARK: - TextView Content

      func initTextViewContent() {
          self.mainTextView.text = ""

          // try to load from NSUserDefault.
          let userDefault = NSUserDefaults.standardUserDefaults()
          if (userDefault.objectForKey(SAVED_TEXT_KEY) != nil) {
              self.mainTextView.text = userDefault.stringForKey(SAVED_TEXT_KEY)
          }

      }

      func textViewDidChange(textView: UITextView) {
          // save to NSUserDefault until save.
          let userDefault = NSUserDefaults.standardUserDefaults()
          userDefault.setObject(textView.text, forKey: SAVED_TEXT_KEY)
      }

      // MARK: - UI Actions

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

      @IBAction func longPressSaveThought(sender: AnyObject) {
          // ask if want to include the last photo
          let alertView = UIAlertController(title: "Save Thought", message: "Do you want to include the last image in Photo Library?", preferredStyle: UIAlertControllerStyle.ActionSheet)

          alertView.addAction(UIAlertAction(title: "Save with last photo", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
              if (self.lastPhoto == nil) {
                  if PHPhotoLibrary.authorizationStatus() == .Authorized {
                      self.promptForPhotoFailing()
                  }else {
                      self.promptForApprovalAgain()
                  }

              } else {
                  self.shareItems([self.mainTextView.text, self.lastPhoto!])
              }

          }))

          alertView.addAction(UIAlertAction(title: "Save the text", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
              self.shareItems([self.mainTextView.text])
          }))


          alertView.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))

          // for iPad
          alertView.popoverPresentationController?.sourceView = self.saveButton

          self.presentViewController(alertView, animated: true, completion: nil)

      }
      @IBAction func saveThought(sender: AnyObject) {
          shareItems([mainTextView.text])
      }


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

      // MARK: - Keyboard events

      func registerKeyboardEvents() {
          NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardShows:", name: UIKeyboardWillShowNotification, object: nil)
          NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardHides:", name: UIKeyboardWillHideNotification, object: nil)
      }

      func keyboardShows(notification:NSNotification) {
          let keyboardRect = notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue()

          NSLog("%@", NSStringFromCGSize(keyboardRect!.size))

          self.bottomMargin.constant = keyboardRect!.size.height + 10
          self.view.layoutIfNeeded()
      }

      func keyboardHides(notification:NSNotification) {
          self.bottomMargin.constant = 20
          self.view.layoutIfNeeded()
      }

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

      // MARK: - Get Last Photo
      func getLastPhoto(completion:(image:UIImage)->Void) {
          let fetchOptions = PHFetchOptions()
          fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]

          let fetchResult = PHAsset.fetchAssetsWithOptions(fetchOptions)

          NSLog("Fetch result: %d", fetchResult.count)

          let lastPhoto = fetchResult.lastObject as! PHAsset

          NSLog("last Photo: %@", lastPhoto)

          let requestOptions = PHImageRequestOptions()
          requestOptions.synchronous = true
          requestOptions.networkAccessAllowed = true

          PHImageManager.defaultManager().requestImageDataForAsset(lastPhoto, options: requestOptions, resultHandler: { (imageData, dataUTI, orientation, info) -> Void in

              if (imageData == nil) {
                  NSLog("Error fetching photo! %@", info)
                  return
              }

              let photo = UIImage(data: imageData!)

              NSLog("photo: %@", photo!)
              completion(image: photo!)
          })
      }


  }


}