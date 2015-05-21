#lang pollen

◊headline{LocalNotificationManager}


Header:

◊objc{
@interface LocalNotificationManager : NSObject

+ (LocalNotificationManager*)sharedManager;

- (BOOL)hasNotifications;
- (void)registerNotification;
- (void)removeAllNotifications;
- (void)scheduleNotificationWithInterval: (int)seconds;

@end
}

Implementation:

◊objc{
#import "LocalNotificationManager.h"

static NSString *EXTRA_CATEGORY = @"EXTRA_CATEGORY";

@implementation LocalNotificationManager

// Singleton
// Note: this may not be the best singleton pattern implementation.
static LocalNotificationManager *instance;

+ (LocalNotificationManager*)sharedManager {
    if (instance == nil) {
        instance = [[LocalNotificationManager alloc] init];
    }
    return instance;
}

- (BOOL)hasNotifications {
    return [[UIApplication sharedApplication] scheduledLocalNotifications].count > 0;
}

- (void)registerNotification {
    // type
    UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge;

    // actions
    UIMutableUserNotificationAction *action = [[UIMutableUserNotificationAction alloc] init];
    action.identifier = @"EXTRA";
    action.title = @"+30s";
    action.activationMode = UIUserNotificationActivationModeBackground;
    action.destructive = NO;
    action.authenticationRequired = NO;

    // action category
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
    category.identifier = EXTRA_CATEGORY;
    [category setActions:@[action] forContext:UIUserNotificationActionContextDefault];
    [category setActions:@[action] forContext:UIUserNotificationActionContextMinimal];

    // packing into setting
    UIUserNotificationSettings *settings =
    [UIUserNotificationSettings settingsForTypes:type
                                      categories:[NSSet setWithArray:@[category]]];

    // really register the notification
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

- (void)removeAllNotifications {
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)scheduleNotificationWithInterval: (int)seconds {

    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow: seconds];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = @"Time’s up!";
    notification.alertAction = @"Dismiss";
    notification.soundName = @"alert.aif";
    notification.applicationIconBadgeNumber = 0; // set this if you need the number on icon in home screen.
    notification.userInfo = @{}; // set this if you need any extra data.
    notification.category = EXTRA_CATEGORY;

    NSLog(@"Scheduling category: %@", notification.category);

    [[UIApplication sharedApplication] scheduleLocalNotification:notification];

}

@end
}