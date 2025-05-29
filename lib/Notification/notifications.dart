// Future<void> sendPushMessage() async {
//     if (_token == null) {
//       print('Unable to send FCM message, no token exists.');
//       return;
//     }

//     try {
//       await http.post(
//         Uri.parse('https://api.rnfirebase.io/messaging/send'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: constructFCMPayload(_token),
//       );
//       print('FCM request for device sent!');
//     } catch (e) {
//       print(e);
//     }
//   }
