#lang pollen

◊headline{Step 8—Core logic of Share Extension}

◊(steps
  ◊step{In the ◊code{ShareViewController.swift} file, define the following function that send an email of the given text.
    ◊swift{
      func mail(content:String) {
        NSLog("Sharing Text: %@ \n", content)

        let key = "<Your Key>"

        let (subject, to, from) = EmailSetting.sharedSetting.load()

        let parameters = [
            "from": from,
            "to": to,
            "subject": subject,
            "text": content
        ]

        let url = "https://api.mailgun.net/v3/<Your Domain>/messages"

        let r = request(.POST, url, parameters:parameters)
            .authenticate(user: "api", password: key)
            .response { (request, response, data, error) in
        }
      }
    }
  }
  ◊step{Next, we handle the ◊code{didSelectPost} action:
    ◊swift{
      override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
        let inputItems = extensionContext?.inputItems

        var sharingText = contentText

        var item = inputItems![0] as! NSExtensionItem

        var attachments = item.attachments

        // determine sharing type
        if let itemProvider = attachments?[0] as? NSItemProvider {
            if itemProvider.hasItemConformingToTypeIdentifier("public.url") {
                NSLog("Found a public URL")
                itemProvider.loadItemForTypeIdentifier("public.url", options: nil, completionHandler: { (coding, error) -> Void in
                    if let url = coding as? NSURL {
                        sharingText = NSString(format: "%@\n\n%@", sharingText, url.absoluteString!) as String

                        // Really save it:
                        self.mail(sharingText)

                        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
                        self.extensionContext!.completeRequestReturningItems([], completionHandler: nil)

                    } else {
                        self.extensionContext!.cancelRequestWithError(NSError())
                    }
                })
            } else {
                self.mail(sharingText)

                // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
                self.extensionContext!.completeRequestReturningItems([], completionHandler: nil)
            }
        } else {
            self.extensionContext!.cancelRequestWithError(NSError())
        }
      }
    }
  }
)

After installing the app into the iOS, we can share text to the “Mail Me” extension in the activity sharing view.

◊sidenote{You (and user) will need to click “More” in the activity view and enable your extension to see and use it.}

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/IMG_4689.jpg"]{Mail Me extension in the UIActivityViewController.}

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/IMG_4690.jpg"]{Sample text sharing via Mail Me extension.}

After tapping the “Post” button, the extension sends an email to the defined addresses. The following shows the result.

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/IMG_4692.jpg"]{Email result.}

◊section{What just happened?}

The default view controller of the share extension inherits the ◊code{SLComposeServiceViewController}.

◊swift{
  class ShareViewController: SLComposeServiceViewController {...}
}

Here is the components inside the default ◊code{SLComposeServiceViewController}:

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/default-share-view.png"]{Components of SLComposeServiceViewController.}





