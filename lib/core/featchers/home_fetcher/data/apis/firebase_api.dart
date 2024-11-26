import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:movie/core/utils/const.dart';

class FireBaseApi{
  FirebaseMessaging messaging = FirebaseMessaging.instance;




 Future sendNotification()async{
   final fcmToken = await messaging.getToken();
   //save
AppConst.fcmToken=fcmToken;
print('fcm token $fcmToken');
////////////////////////////////////////////////////////////
  NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true
  );
   print('User granted permission: ${settings.authorizationStatus}');
  }

}