# Haptics iOS Kha

Kha library for haptic feedback on iOS. Only works on iOS 10+ and iPhone 7 and up. On older versions of iOS and devices that don't support it the function calls are ignored.

## Installation
Clone this repository into the Libraries folder of your Kha project and add the following line to your khafile.js:  
```
project.addLibrary('haptics-ios-kha');
```

## Usage
`Haptics.play(HapticsType);` to play the feedback.  
There are several types of haptic feedback you can use. The HapticsType enum has the following types:
```
SELECTION
LIGHT
MEDIUM
HEAVY
SUCCESS
WARNING
ERROR
```

So for example `Haptics.play(MEDIUM);` plays the medium feedback.
