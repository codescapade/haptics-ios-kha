/*
 * MIT License
 *
 * Copyright (c) 2019 Juriën Meerlo
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include "HapticsK.h"

#import <UIKit/UIKit.h>

namespace HapticsK {
  enum HapticsType {
    SELECTION,
    LIGHT,
    MEDIUM,
    HEAVY,
    SUCCESS,
    WARNING,
    ERROR
  };

  void playSelection() {
    auto gen = [[UISelectionFeedbackGenerator alloc] init];
    [gen prepare];
    [gen selectionChanged];
  }

  void playLight() {
    auto gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
    [gen prepare];
    [gen impactOccurred];
  }

  void playMedium() {
    auto gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
    [gen prepare];
    [gen impactOccurred];
  }

  void playHeavy() {
    auto gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
    [gen prepare];
    [gen impactOccurred];
  }

  void playSuccess() {
    auto gen = [[UINotificationFeedbackGenerator alloc] init];
    [gen prepare];
    [gen notificationOccurred:UINotificationFeedbackTypeSuccess];
  }

  void playWarning() {
    auto gen = [[UINotificationFeedbackGenerator alloc] init];
    [gen prepare];
    [gen notificationOccurred:UINotificationFeedbackTypeWarning];
  }

  void playError() {
    auto gen = [[UINotificationFeedbackGenerator alloc] init];
    [gen prepare];
    [gen notificationOccurred:UINotificationFeedbackTypeError];
  }

  void play(int type) {
    if (@available(iOS 10, *)) {
      auto hapticsType = static_cast<HapticsType>(type);

      switch(hapticsType) {
        case SELECTION:
          playSelection();
          break;

        case LIGHT:
          playLight();
          break;

        case MEDIUM:
          playMedium();
          break;

        case HEAVY:
          playHeavy();
          break;

        case SUCCESS:
          playSuccess();
          break;

        case WARNING:
          playWarning();
          break;

        case ERROR:
          playError();
          break;

        default:
          break;
      }
    }
  }
}
