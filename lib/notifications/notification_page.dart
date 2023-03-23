import 'package:bookmyshow/main.dart';
import 'package:bookmyshow/provider/notification_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage();

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  dynamic x;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final notify = Provider.of<NotificationList>(context, listen: false);

    // final notify = Provider.of<NotificationList>(context);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification!.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              color: Colors.blue, playSound: true, icon: '@mipmap/ic_launcher'),
        ),
      );
    });

    OneSignal.shared.setNotificationOpenedHandler((data) {
      notify.addNotificationDetails(
          id: data.notification.notificationId,
          title: data.notification.title!,
          body: data.notification.body!,
          imgurl: data.notification.bigPicture!);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessageOpenedApp event published');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(
                '${notification?.title}',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              content: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('${notification?.body}')],
              )),
            );
          });
    });
  }

  void showNotification() {
    flutterLocalNotificationsPlugin.show(
        0,
        'Watch PS-I near your theatres',
        'Grab your seats now!!',
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  void addNotification(NotificationList notify) {
    notify.addNotificationDetails(
        id: "1", title: "Hi", body: "Test12", imgurl: "hello");
  }

  @override
  Widget build(BuildContext context) {
    final notify = Provider.of<NotificationList>(context);
    OneSignal.shared.setNotificationOpenedHandler((data) {
      notify.addNotificationDetails(
          id: data.notification.notificationId,
          title: data.notification.title!,
          body: data.notification.body!,
          imgurl: data.notification.bigPicture!);
    });
    // notify.addNotificationDetails();
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () => Navigator.of(context).pop()),
          backgroundColor: Color.fromARGB(255, 10, 21, 46),
          actions: [
            IconButton(
              onPressed: () => addNotification(notify),
              icon: Icon(Icons.notification_add),
            )
          ],
          title: const Text("Notifications")),
      body: notify.notificationsList.isEmpty
          ? const Center(child: Text("No New Notifications"))
          : SingleChildScrollView(
              child: Column(children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: notify.notificationsList.length,
                  itemBuilder: (context, index) => Container(
                    child: Dismissible(
                      direction: DismissDirection.horizontal,
                      onDismissed: ((direction) => notify.deleteNotification(
                          notify.notificationsList[index].id)),
                      key: ValueKey(notify.notificationsList[index].id),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                  "${notify.notificationsList[index].title}"),
                              subtitle: Text(
                                  "${notify.notificationsList[index].body}"),
                            ),
                            FittedBox(
                              fit: BoxFit.cover,
                              child: Image.network(
                                  notify.notificationsList[index].imgurl),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
    );
  }
}
