// import 'package:flutter/material.dart';



// class CheckConditions extends StatefulWidget {
//   late final NotificationSetting notificationSetting;

//   @override
//   State<CheckConditions> createState() => _CheckConditionsState();
// }

// class _CheckConditionsState extends State<CheckConditions> {
//   final allowNotifications = NotificationSetting(title: 'Mark all');

//   final notifications = [
//     NotificationSetting(
//         title: 'I authorize the consultation of my credit history'),
//     NotificationSetting(
//         title: 'I authorize them to use my data to communicate with me'),
//     // NotificationSetting(title: 'Objetivo 3'),
//   ];

//   @override
//   Widget build(BuildContext context) => SizedBox(
//         width: 300,
//         height: 300,
//         child: ListView(
//           children: [
//             buildToggleCheckbox(allowNotifications),
//             const Divider(
//               indent: 2,
//             ),
//             ...notifications.map(buildSingleCheckbox).toList(),
//           ],
//         ),
//       );

//   Widget buildToggleCheckbox(NotificationSetting notification) => buildCheckbox(
//       notificationSetting: notification,
//       onClicked: () {
//         final newValue = !notification.value;

//         setState(() {
//           allowNotifications.value = newValue;
//           for (var notification in notifications) {
//             notification.value = newValue;
//           }
//         });
//       });

//   Widget buildSingleCheckbox(NotificationSetting notification) => buildCheckbox(
//         notificationSetting: notification,
//         onClicked: () {
//           setState(() {
//             final newValue = !notification.value;
//             notification.value = newValue;

//             if (!newValue) {
//               allowNotifications.value = false;
//             } else {
//               final allow =
//                   notifications.every((notification) => notification.value);
//               allowNotifications.value = allow;
//             }
//           });
//         },
//       );

//   Widget buildCheckbox({
//     required NotificationSetting notificationSetting,
//     required VoidCallback onClicked,
//   }) =>
//       ListTile(
//         onTap: onClicked,
//         leading: Checkbox(
//           value: notificationSetting.value,
//           onChanged: (value) => onClicked(),
//         ),
//         title: Text(
//           notificationSetting.title,
//           style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//         ),
//       );
// }
