#lang pollen

◊headline{Testing environment}

How we test our website?

◊section["simulator"]{Testing in simulator}

We will also need to install emulator for both iOS and android system.

◊(sidenote
◊figure["http://makzan.net/assets/introducing-web-design/test-in-ios-simulator-5911e7a217893f6a6e245d0ce3281477.png"]{Screenshot of iOS Simulator}
)

The iOS simulator can be installed via the XCode, the apple development toolkit. The android emulator, on the other hand, can be installed via the android SDK. Alternatively, 3rd party emulator may be used, such as ◊link["https://www.genymotion.com/"]{genymotion}.


◊section["real-devices"]{Testing in real devices}

Beside simulating our web in the mobile simulator, we need to have real devices to further test it.

Not only because simulator cannot simulate all the things, but also because holding the web on hand is important. We need the feeling of scrolling the screen, tapping on links and buttons, and inputting the form value with the virtual keyboard.


