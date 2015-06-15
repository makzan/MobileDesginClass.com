#lang pollen

◊headline{Step 6—Configuring app group}

When impelementing the ◊code{EmailSetting} class, we used the ◊code{NSUserDefaults} by providing the suite name:
◊swift{
  NSUserDefaults(suiteName: "group.net.makzan.QuickMailMe")
}

For both main app and the extension, we need to configure the App Group to use this key in order to make the app works. By setting both process into the same App Group, they can share the stored NSUserDefaults values.

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-06-15%20at%204.38.05%20PM.png"]{Setting the App Group}
