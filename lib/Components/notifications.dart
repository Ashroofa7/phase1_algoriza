import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:project1algoriza/main.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
class LocalNotifications {

  static final notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final ios = IOSInitializationSettings();
    final settings = InitializationSettings(
      android: android,
      iOS: ios,
    );
    await notifications.initialize(
        settings,
        onSelectNotification: (payload) async {
          onNotifications.add(payload);
        });
  }

  static Future ReceivedNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime ScheduledDate,
  }) async =>
      {
        notifications.zonedSchedule(
          id,
          title='meme',
          body='meme',
          tz.TZDateTime.from(ScheduledDate,tz.local),
          payload:'meme',
          await notificationDetails(),
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          matchDateTimeComponents: DateTimeComponents.time,
        ),
      //  return ScheduledDate;
      };

}
