#lang pollen

◊headline{Step 5—Creating share extension}

The main view’s logic has completed. Now we create the share extension which contains the core logic of our app—Taking the text input and send email.

◊(steps
  ◊step{In the project, create a new target and choose ◊em{Share Extension}
    ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-06-15%20at%203.26.21%20PM.png"]{new Share Extension.}
  }
  ◊step{Give the extension a name, I used “Mail Me”. Then give the extension a bundle ID. You may make the ID something like: “<main app ID>.mail-me-extension”. }
  ◊step{Open the ◊code{Info.plist} in the extension folder. Configure the extension with the following settings.
    ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-06-15%20at%205.31.51%20PM.png"]{Info.plist for the extension.}
    Alternatively, you may open the plist as XML source file and paste the following code:
    ◊xml{
      <key>NSExtension</key>
      <dict>
        <key>NSExtensionAttributes</key>
        <dict>
          <key>NSExtensionActivationRule</key>
          <dict>
            <key>NSExtensionActivationSupportsImageWithMaxCount</key>
            <integer>0</integer>
            <key>NSExtensionActivationSupportsMovieWithMaxCount</key>
            <integer>0</integer>
            <key>NSExtensionActivationSupportsText</key>
            <true/>
            <key>NSExtensionActivationSupportsWebURLWithMaxCount</key>
            <integer>1</integer>
          </dict>
        </dict>
        <key>NSExtensionMainStoryboard</key>
        <string>MainInterface</string>
        <key>NSExtensionPointIdentifier</key>
        <string>com.apple.share-services</string>
      </dict>
    }
  }
)

◊section{What just happened?}



