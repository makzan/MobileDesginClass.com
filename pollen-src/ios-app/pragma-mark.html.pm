#lang pollen

◊headline{Pragma mark in swift}

Pragma mark allows easily seperate methods into groups, in both source code and navigation panel.

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%205.58.17%20PM.png"]{Navigation panel with pragma marks defined.}

The Pragma Mark in Objective-C:

◊objc{
#pragma mark
}

The Pragma Mark in Swift:

◊swift{
// MARK:
}

For example, the horizontal line can be presented by:

◊swift{
// MARK: -
}

Title following an horizontal line would be:

◊swift{
// MARK: - Text Goes Here
}
