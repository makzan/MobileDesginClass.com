#lang pollen

◊headline{NSTimer+MZTimer}

◊objc{
#import <Foundation/Foundation.h>

@interface NSNumber (MZTimer)
- (NSString *)stringOfMinuteSecond;
@end

}

◊objc{
#import "NSNumber+MZTimer.h"

@implementation NSNumber (MZTimer)
- (NSString *)stringOfMinuteSecond {
  int m = [self intValue] / 60;
  int s = [self intValue] % 60;
  return [NSString stringWithFormat:@"%02d:%02d", m, s];
}
@end
}