import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  late BuildContext _context;

  Future<FlutterLocalNotificationsPlugin> initNotifies(
      BuildContext context) async {
    _context = context;

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('assets/images/logo.png');
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

    return flutterLocalNotificationsPlugin;
  }

  Future showNotification(String title, String description, int time, int id,
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        description,
        tz.TZDateTime.now(tz.local).add(Duration(milliseconds: time)),
        const NotificationDetails(
            android: AndroidNotificationDetails('medicines_id', 'medicines',
                importance: Importance.high,
                priority: Priority.high,
                color: Colors.cyanAccent)),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future removeNotify(int notifyId,
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    try {
      return await flutterLocalNotificationsPlugin.cancel(notifyId);
    } catch (e) {
      return null;
    }
  }

  Future onDidReceiveNotificationResponse(NotificationResponse? details) async {
    showDialog(
      context: _context,
      builder: (_) => AlertDialog(
        title: const Text("PayLoad"),
        content: Text("Payload : ${details?.payload}"),
      ),
    );
  }
}
