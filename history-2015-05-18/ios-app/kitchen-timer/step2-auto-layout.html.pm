#lang pollen

◊headline{Step 2—Adding Auto Layout}

After preparing the basic user interface, we make the interface response to different screen sizes.

◊sidenote{
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-17%20at%209.04.50%20PM.png"]{Interface being cropped without setting Auto Layout}
}

◊section{Size Classes}

My Piority on setting Auto Layout for different sizes.

1. Begin with ANY width ANY height

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%202.28.01%20PM.png"]{All layout starts at any width and any height.}

2. COMPACT width ANY height

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%202.28.08%20PM.png"]{Then we work on the compact width and any height.}

3. ANY width COMPACT height

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%202.28.11%20PM.png"]{Any width and compact height.}

4. REGULAR width and REGULAR height

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%202.28.24%20PM.png"]{Regular for iPad.}


◊section{Constraints}

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%202.28.38%20PM.png"]{Constraints.}

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%202.28.48%20PM.png"]{Alignment constraints.}