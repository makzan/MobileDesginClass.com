#lang pollen

◊headline{Step 2—Adding Auto Layout}

After preparing the basic user interface, we prepare the AutoLayout to make the interface response to different screen sizes. There are different size classes that we can define individual layout rules to each of them. By default, we start at ◊em{any} width and ◊em{any} height.

◊sidenote{
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-17%20at%209.04.50%20PM.png"]{Interface is cropped if we don’t setup the Auto Layout.}
}

◊section{Size Classes}

My Piority on setting Auto Layout for different sizes.

1. We begin with ◊em{any} width ◊em{any} height.

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%202.28.01%20PM.png"]{All layout starts at any width and any height.}

2. ◊em{Compact} width ◊em{any} height.

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%202.28.08%20PM.png"]{Then we work on the compact width and any height.}

3. ◊em{Any} width ◊em{compact} height.

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%202.28.11%20PM.png"]{Any width and compact height.}

4. ◊em{Regular} width and ◊em{regular} height.

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%202.28.24%20PM.png"]{Regular for iPad.}


◊section{Constraints}

We control how the layout floats in the container by defining constraints. The purpose of constraints is to let the system being able to calculate the frame with position—x, y—and dimension—width and height.

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%202.28.38%20PM.png"]{Constraints.}

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-18%20at%202.28.48%20PM.png"]{Alignment constraints.}