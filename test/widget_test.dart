// // // This is a basic Flutter widget test.
// // //
// // // To perform an interaction with a widget in your test, use the WidgetTester
// // // utility in the flutter_test package. For example, you can send tap and scroll
// // // gestures. You can also use WidgetTester to find child widgets in the widget
// // // tree, read text, and verify that the values of widget properties are correct.

// // import 'package:flutter/material.dart';
// // import 'package:flutter_test/flutter_test.dart';

// // import 'package:newproject/main.dart';

// // void main() {
// //   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
// //     // Build our app and trigger a frame.
// //     await tester.pumpWidget(const MyApp());

// //     // Verify that our counter starts at 0.
// //     expect(find.text('0'), findsOneWidget);
// //     expect(find.text('1'), findsNothing);

// //     // Tap the '+' icon and trigger a frame.
// //     await tester.tap(find.byIcon(Icons.add));
// //     await tester.pump();

// //     // Verify that our counter has incremented.
// //     expect(find.text('0'), findsNothing);
// //     expect(find.text('1'), findsOneWidget);
// //   });
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:newproject/main.dart'; // تأكد من أن المسار يطابق اسم مشروعك

// void main() {
//   testWidgets('Weather App startup test', (WidgetTester tester) async {
//     // 1. تشغيل التطبيق (قُم بتمرير الويدجت الرئيسية لديك، مثل MyApp)
//     await tester.pumpWidget(const MyApp());

//     // 2. التحقق من أن التطبيق يبدأ بشكل سليم ويعرض الـ MaterialApp أو شاشة البداية
//     expect(find.byType(MaterialApp), findsOneWidget);

//     // يمكنك أيضاً التأكد من عدم ظهور أخطاء أثناء الإقلاع
//   });
// }
