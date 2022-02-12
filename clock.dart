import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// função deve ser chamada em um onPressed (android ou ios)... deve ser colocado no final da função da pagina
void scheduleAlarm() async {
  var scheduledNotificationDateTime = DateTime.now().add(Duration(seconds: 10));

  var androidPlataformChannelSpecifics = AndroidNotificationDetails(
    'alarm_notif',
    'alarm_notif',
    'Channel for Alarm notification',
    icon: 'codex_logo',
    sound: RawResourceAndroidNotificationSound('musica'),
    largeIcon: DrawableResourceAndroidBitmap('logo'),
  );

  var iOSPlataformChannelSpecifics = IOSNotificationDetails(
      sound: 'musica.waw',
      presentAlert: true,
      presentBadge: true,
      presentSound: true);
  var plataformChannelSpecifics = NotificationDetails(
      androidPlataformChannelSpecifics, iOSPlataformChannelSpecifics);
  await FlutterLocalNotificationsPlugin.schedule(
      0,
      'Algo',
      'Bom dia, trabalhar',
      scheduledNotificationDateTime,
      plataformChannelSpecifics);
}
